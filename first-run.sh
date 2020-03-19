#!/bin/bash
xhost +
./docker-wine winetricks -q dotnet20
