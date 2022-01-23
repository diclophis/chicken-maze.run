#!/bin/bash

polly build Dockerfile

docker run --rm -p 8000:8000 chicken-maze.run:latest 
