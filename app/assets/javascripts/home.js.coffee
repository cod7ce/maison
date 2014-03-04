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

$(document).on "ready page:load", ->
  if $('#home-index').length
    $.fn.fullpage {
      loopHorizontal: false,
      easing: 'easeInOutQuart',
      scrollingSpeed: 1500,
      paddingBottom: '30px',
      navigation: true,
      afterRender: ->
       $('#maison, #maison-github, .jumbotron p').addClass 'active';
    }
  if $('#home-about').length
    $.fn.fullpage {
      verticalCentered: true,
      loopHorizontal: false,
      scrollingSpeed: 150,
      controlArrowColor: '#eee'
    }
