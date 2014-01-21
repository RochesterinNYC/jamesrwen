# Use local alias
# $ = jQuery

# Namespacing
window.SidebarManager ||= {}

SidebarManager.initializeNav = () ->
  url = document.URL
  slash_index = url.lastIndexOf("/")
  stub = url.substring(slash_index + 1, url.length)
  if stub.length is 0
    $('.home-link').addClass('active-link')
  else if (stub.indexOf("?source=PERSONAL") > -1)
    $('.portfolio-link').addClass('active-link')
  else if (stub.indexOf("?source=COURSE") > -1)
    $('.courses-link').addClass('active-link')
  else if (stub.indexOf("?source=HACKATHON") > -1)
    $('.hackathons-link').addClass('active-link')
  else
    $('.' + stub + '-link').addClass('active-link')