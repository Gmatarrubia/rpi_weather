# rpi_weather
Weather App written in Flutter and specifically designed for Rapsberry Pi.

<table border="0">
 <tr>
    <td><b> <img src="images/app1.jpg" width="350"> </b></td>
    <td><b> <img src="images/app2.jpg" width="400"> </b></td>
 </tr>
</table>

# Environment setup
It also comes with a selfcontained environment. So, it lets you start delevoping in seconds.
You can choose between these 3 modes of use:

* Native. 
Open Vscode/Android Studio and develop as usual with your flutter deps already installed.

* Dockerized. Develop inside of a container!
```
git clone https://github.com/Gmatarrubia/rpi_weather
cd rpi_weather
./init-docker-env.sh
./build.sh
./runApp.sh
```
* Develop in container VsCode. All Vscode dev environment in a container.
```
git clone https://github.com/Gmatarrubia/rpi_weather
cd rpi_weather
code .
# Click on "reopen in container"
# Start to develop
```

