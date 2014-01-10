# Use local alias
# $ = jQuery

# Namespacing
window.SidebarManager ||= {}

SidebarManager.initializeNav = () ->
  url = document.URL
  slash_index = url.lastIndexOf("/")
  stub = url.substring(slash_index + 1, url.length)
  $('.' + stub + '-link').addClass('active-link')
  if stub.length is 0
    $('.home-link').addClass('active-link')