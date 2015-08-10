SERIES MONITOR
==============

### Description ###

Just a simple application I created to notify me when there's a new episode of Dragon Ball Super available :P.
It consists of a desktop system tray application which periodically verifies the presence of a new episode online

### Code ###

Application implemented with JRuby


### Steps do build ###

1- Install the rvm
~~~~
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --rails
~~~~~

2- Install jruby
~~~~
rvm install jruby
rvm use jruby-x.y.z
~~~~

3- Install bundler
~~~~
gem install bundler
~~~~

4- Create ruby environment
~~~~
git clone https://github.com/renatorp/SeriesMonitor.git
cd SeriesMonitor
bundle install
rawr install
~~~~

5- Generate executable
~~~~
bundle exec rake rawr:jar
~~~~

6- Run*
~~~~
java -jar package/jar/SeriesMonitor.jar
~~~~

### Running as a ruby application ###
~~~~
bundle exec jrubyw src/main.rb
~~~~

### On Windows ###
Download and install JRuby and execute the following commands in the windows prompt (cmd)

~~~~
gem install bundler
git clone https://github.com/renatorp/SeriesMonitor.git
cd SeriesMonitor
bundle install
bundle exec jrubyw src/main.rb
~~~~

To start the program at the windows initialization, create a .VBS file with the following code to your startup folder (ex: C:\Users\Someone\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\ ).

~~~~~
series_monitor_path = "C:\temp\SeriesMonitor\"  '<<--- YOUR PATH HERE

Set WshShell = CreateObject("WScript.Shell")
WshShell.Run """YOUR_PATH_HERE_TOO\seriesmonitor.bat """ & series_monitor_path, 0
Set WshShell = Nothing
~~~~

\* The jar file only runs when the lib folder is located in its directory (I know, its ugly ¬¬)
