# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
initTop = 0;
$ ->
  $(window).scroll ->
    scrollTop = $(document).scrollTop()
    if scrollTop > initTop && scrollTop > 0
      $('.header-wrapper').addClass('header-close')
    else 
      $('.header-wrapper').removeClass('header-close')
    initTop = scrollTop
