# encoding: utf-8
$:.unshift File.dirname(__FILE__) #Including current dir to $LOAD_PATH

require 'tray_application'; 
require 'series_monitor';
require 'dbz_page_parser'
include Java

#Deactivate java headless mode
#http://www.oracle.com/technetwork/articles/javase/headless-136834.html
java.lang.System::setProperty("java.awt.headless", "false"); 

#Creates parser
parser = DBZPageParser.new()

#Creates monitor
series_monitor = SeriesMonitor.new parser
#series_monitor.interval = 5  

#Creates Tray Application
app = TrayApplication.new("SeriesMonitor")
app.icon_filename = "#{File.dirname(__FILE__)}/../images/075005-ultra-glossy-silver-button-icon-alphanumeric-letter-m.png"
app.item('Abrir em browser') {app.open_last_in_browser(parser.get_link)}
app.item('Exit') {java.lang.System::exit(0)}

#Creates notification of episode available
series_monitor.notification_callback = Proc.new do |msg, link|
	app.notify_user("Series Monitor", msg, link)
end

app.run {series_monitor.start}
