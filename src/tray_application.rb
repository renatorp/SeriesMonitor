class TrayApplication


  include Java
  import java.awt.TrayIcon
  import java.awt.Toolkit
  import java.awt.Desktop

  attr_accessor :icon_filename
  attr_accessor :menu_items

  def initialize(name = 'Tray Application')
    @menu_items = []
    @name       = name
  end

  def item(label, &block)
    item = java.awt.MenuItem.new(label)
    item.add_action_listener(block)
    @menu_items << item
  end

  def run
    popup = java.awt.PopupMenu.new
    @menu_items.each{|i| popup.add(i)}

    # Give the tray an icon and attach the popup menu to it
    image    = java.awt.Toolkit::default_toolkit.get_image(@icon_filename)
    @tray_icon = TrayIcon.new(image, @name, popup)
    @tray_icon.image_auto_size = true

    
    # Finally add the tray icon to the tray
    @tray = java.awt.SystemTray::system_tray
    @tray.add(@tray_icon)

    # run application
    yield

  end

  def notify_user(caption, text, link)
    @tray_icon.add_action_listener {open_last_in_browser(link)}
    @tray_icon.displayMessage(caption, text, TrayIcon::MessageType::INFO)
  end

 def open_last_in_browser(link)
    if (link) 
	     Desktop.getDesktop().browse(java.net.URI.new(link))
    end
 end

end