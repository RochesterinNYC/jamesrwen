# Use local alias
# $ = jQuery

# Namespacing
window.MarkdownConverter ||= {}

MarkdownConverter.updatePreview = () ->
  #window.TweetArray = []
  formData = {
    'markdown_content': $('#markdown-input').val()
  }
  url = document.location.protocol + "//" + document.location.host + "/markdown"
  params = { url: url, data: formData, type: 'POST', timeout: 5000, error: MarkdownConverter.validateError, statusCode: { 401: MarkdownConverter.validateError, 406: MarkdownConverter.validateError, 200: MarkdownConverter.validateSuccess }}
  # params.dataType = 'jsonp' if JSONP # use JSONP for development
  $.ajax(params)

MarkdownConverter.validateError = (data) ->
  #TweetStreamUI.showError()

MarkdownConverter.validateSuccess = (data) ->
  document.getElementById("preview").innerHTML = data.html_content