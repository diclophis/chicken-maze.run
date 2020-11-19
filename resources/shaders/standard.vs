#ifdef NEWER_GL
precision highp float;
#endif


#ifdef NEWER_GL
in vec3 vertexPosition;
in vec2 vertexTexCoord;
in vec3 vertexNormal;
in vec4 vertexColor;
#else
attribute vec3 vertexPosition;
attribute vec2 vertexTexCoord;
attribute vec3 vertexNormal;
attribute vec4 vertexColor;
#endif


uniform mat4 mvp;
uniform mat4 view;
uniform mat4 projection;
layout (location = 12) in mat4 matModel;


#ifdef NEWER_GL
out vec3 fragPositionn;
out vec2 fragTexCoord;
out vec4 fragColor;
out vec3 fragNormal;
#else
varying vec3 fragPosition;
varying vec2 fragTexCoord;
varying vec4 fragColor;
varying vec3 fragNormal;
#endif


void main()
{
    fragTexCoord = vertexTexCoord;
    fragColor = vertexColor;

    ////vec4 fpp = mvp * matModel * vec4(vertexPosition, 1.0); 
    ////fragPositionn = vec3(matModel * mvp) - vertexPosition;
    ////fragPositionn = vec3(-15.0, 1.0, 7.0);
    //fragPositionn = vec3(mvp * matModel * vec4(vertexPosition, 1.0)); //vertexPosition;
    //mat3 normalMatrix = transpose(inverse(mat3(matModel)));
    //fragNormal = normalize(normalMatrix * vertexNormal);
    //gl_Position = mvp * matModel * vec4(vertexPosition, 1.0);
    //    //fragPositionn = vec3(mvp * matModel) + vertexPosition;
    //    //position_cs = (mModelView * vec4(position,1.0)).xyz;
    //    //fragPositionn = (matModel * vec4(vertexPosition, 1.0)).xyz;
    //    gl_Position = fpp;
    //    //vec4 pos = matModel * vec4(vertexPosition, 1.0);
    //    //fragPosition = vec3(pos);
    //    //gl_Position = mvp * vec4(vertexPosition, 1.0);
    //// Send vertex attributes to fragment shader
    //// Calculate final vertex position

    fragPositionn = vec3(matModel * vec4(vertexPosition, 1.0));
    mat3 normalMatrix = transpose(inverse(mat3(matModel)));
    fragNormal = normalize(normalMatrix * vertexNormal);
    mat4 mvpi = mvp * matModel;
    gl_Position = mvpi * vec4(vertexPosition, 1.0);
}
