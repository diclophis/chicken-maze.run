precision highp float;

#ifdef NEWER_GL
in vec3 fragPositionn;
in vec2 fragTexCoord;
in vec4 fragColor;
in vec3 fragNormal;
#else
varying vec3 fragPosition;
varying vec2 fragTexCoord;
varying vec4 fragColor;
varying vec3 fragNormal;
#endif


uniform sampler2D texture0;
uniform vec4 colDiffuse;


#ifdef NEWER_GL
out vec4 finalColor;
#endif

#define     MAX_LIGHTS              1
#define     LIGHT_DIRECTIONAL       0
#define     LIGHT_POINT             1
#define     LIGHT_SPOT              2

struct MaterialProperty {
    vec3 color;
    int useSampler;
    sampler2D sampler;
};

struct Light {
    int enabled;
    int type;
    vec3 position;
    vec3 target;
    vec4 color;
    float intensity;
    float radius;
    float coneAngle;
};


uniform Light lights[MAX_LIGHTS];
uniform vec4 ambient;
uniform vec3 viewPos;
uniform mat4 matModel;


//const float glossiness = 0.0001;
//vec3 ComputeLightPoint(Light l, vec3 n, vec3 s)
//{
//    //calculate the vector from this pixels surface to the light source
//    vec3 surfaceToLight = l.position;
//
//    //calculate the cosine of the angle of incidence
//    float brightness = dot(n, surfaceToLight) / (length(surfaceToLight) * length(n));
//    //TODO:
//    brightness = clamp(brightness, 0.0, 1.0);
//
//    //calculate final color of the pixel, based on:
//    // 1. The angle of incidence: brightness
//    // 2. The color/intensities of the light: light.intensities
//    // 3. The texture and texture coord: texture(tex, fragTexCoord)
//    float diff = 1.0/dot(surfaceToLight/l.radius, surfaceToLight/l.radius)*brightness*l.intensity;
//
//    return (diff * l.color.rgb);
//}


vec3 CalcPointLight(Light light, vec3 normal, vec3 fragPos, vec3 viewDir)
{
    vec3 lightDir = normalize(light.position - fragPos);
    // diffuse shading
    float diff = max(dot(normal, lightDir), 0.0);
    // specular shading
    vec3 reflectDir = reflect(-lightDir, normal);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 1.0); //shiny
    // attenuation
    float distance = length(light.position - fragPos);
    float attenuation = 1.0 / (0.0 + 1.0 * distance + 
  			     1.0 * (distance * distance));    
    // combine results
    vec3 ambient  = 1.0 * vec3(1.0); //vec3(texture(material.diffuse, TexCoords));
    vec3 diffuse  = 1.0 * diff * vec3(1.0); //vec3(texture(material.diffuse, TexCoords));
    vec3 specular = 1.0 * spec * vec3(1.0); //vec3(texture(material.specular, TexCoords));
    ambient  *= attenuation;
    diffuse  *= attenuation;
    specular *= attenuation;
    return (diffuse + specular);
} 


vec3 ComputeLightDirectional(Light l, vec3 n, vec3 s)
{
    return -normalize(l.target - l.position);

    //TODO: this is broken below
    //vec3 lightDir = -normalize(l.target - l.position);
    //float diff = l.intensity;
    ////clamp(float(dot(n, lightDir)), 0.0, 1.0)*l.intensity;
    //return (diff * l.color.rgb);
    ////light = -normalize(lights[i].target - lights[i].position);
}


vec3 ComputeLightSpot(Light l, vec3 n, vec3 fragPos, vec3 s)
{
    vec3 lightToSurface = normalize(fragPos - l.position);
    vec3 lightDir = -normalize(l.target - l.position);
    float diff = clamp(float(dot(n, lightDir)), 0.0, 1.0)*l.intensity;
    float attenuation = (float(dot(n, lightToSurface)));
    attenuation = dot(lightToSurface, -lightDir);
    float lightToSurfaceAngle = degrees(acos(attenuation));
    if (lightToSurfaceAngle > l.coneAngle) attenuation = 0.0;
    float falloff = (l.coneAngle - lightToSurfaceAngle)/l.coneAngle;
    float diffAttenuation = diff*attenuation;
    float spec = 0.0;

    return (falloff*(diffAttenuation*l.color.rgb + spec*s.rgb));
}




void main()
{

#ifndef NEWER_GL
  vec4 finalColor = vec4(0.0);
#endif

#ifdef NEWER_GL
    vec4 texelColor = texture(texture0, fragTexCoord);
#else
    vec4 texelColor = texture2D(texture0, fragTexCoord);
#endif


    vec3 lightDot = vec3(0.0);
    vec3 normal = normalize(fragNormal);
    vec3 viewDir = normalize(viewPos - fragPositionn);
    vec3 specular = vec3(0.0);


    //vec4 texelColor = texture(texture0, fragTexCoord);
    //vec3 lightDot = vec3(0.0);
    //vec3 normal = normalize(fragNormal);
    //vec3 viewD = normalize(viewPos - fragPosition);
    //vec3 specular = vec3(0.0);

    for (int i = 0; i < MAX_LIGHTS; i++)
    {
        if (lights[i].enabled == 1)
        {
            vec3 light = vec3(0.0);

            if (lights[i].type == LIGHT_DIRECTIONAL)
            {
              light = ComputeLightDirectional(lights[i], normal, specular);
              //light = -normalize(lights[i].target - lights[i].position);
            }
       
            if (lights[i].type == LIGHT_POINT)
            {
              light = CalcPointLight(lights[i], normal, fragPositionn, viewDir);  
            }

            if (lights[i].type == LIGHT_SPOT)
            {
              light = ComputeLightSpot(lights[i], normal, fragPositionn, viewDir);  
            }

            //float NdotL = max(dot(normal, light), 0.0);
            //lightDot += lights[i].color.rgb*NdotL;
            //float specCo = 0.0;
            //if (NdotL > 0.0) specCo = pow(max(0.0, dot(viewDir, reflect(-(light), normal))), 1.321); // 16 refers to shine
            //specular += specCo;

            float NdotL = max(dot(normal, light), 0.0);
            lightDot += lights[i].color.rgb*NdotL;

            float specCo = 0.0;
            if (NdotL > 0.0) specCo = pow(max(0.0, dot(viewDir, reflect(-(light), normal))), 8.0); // 16 refers to shine
            specular += specCo;
        }
    }

    //finalColor = (((colDiffuse + vec4(specular, 1.0))*vec4(lightDot, 1.0)));
    //finalColor = pow(finalColor, vec4(1.0/2.2));
    //finalColor = vec4(1.0, 1.0, 1.0, 1.0);

    finalColor = (texelColor*((colDiffuse + vec4(specular, 1.0))*vec4(lightDot, 1.0)));
    finalColor += texelColor*(ambient/10.0)*colDiffuse;
    
    // Gamma correction
    finalColor = pow(finalColor, vec4(1.0/2.2));


#ifndef NEWER_GL
    gl_FragColor = finalColor;
#endif

}
