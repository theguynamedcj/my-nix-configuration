{
  programs.wlogout = {
    enable = true;

  };
  style = ''
    * {
  font-family: DaddyTimeMono Nerd Font;
  background-image: none;
  box-shadow: none;
  transition: 20ms;
}

window {
  background-color: #26233a;
  background-size: cover;
}

button {
  color: #f6c177;
  font-size: 24px;
  padding-bottom: 30px;

  background-repeat: no-repeat;
  background-position: left;
  background-size: 25%;

  border-style: solid;
  background-color: #1f1d2e;
  border: 3px solid #9ccfd8;
}

button:focus,
button:active,
button:hover {
  color: #f6c177;
  background-color: #6e6a86;
  border: 3px solid #9ccfd8;
}

#lock {
  background-image: image(url("./icons/lock.png"));
  margin: 10px;
  border-radius: 20px;
}

#logout {
  background-image: image(url("./icons/logout.png"));
  margin: 10px;
  border-radius: 20px;
}

#suspend {
  background-image: image(url("./icons/suspend.png"));
  margin: 10px;
  border-radius: 20px;
}

#hibernate {
  background-image: image(url("./icons/hibernate.png"));
  margin: 10px;
  border-radius: 20px;
}

#shutdown {
  background-image: image(url("./icons/shutdown.png"));
  margin: 10px;
  border-radius: 20px;
}

#reboot {
  background-image: image(url("./icons/reboot.png"));
  margin: 10px;
  border-radius: 20px;
}
  '';

}