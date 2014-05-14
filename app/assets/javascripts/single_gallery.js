$(function() {

  $('#carousel').carouFredSel({
    responsive: true,
  circular: false,
  auto: false,
  items: {
    visible: 1,
  width: 200,
  height: '56%'
  },
  scroll: {
    fx: 'directscroll'
  }
  });

  $('#thumbs').carouFredSel({
    responsive: true,
    circular: false,
    infinite: false,
    auto: false,
    prev: '#prev',
    next: '#next',
    items: {
      visible: {
        min: 2,
    max: 4
      },
    width: 202,
    height: '66%'
    }
  });

  $('#thumbs a').click(function() {
    $('#carousel').trigger('slideTo', '#' + this.href.split('#').pop() );
    $('#thumbs a').removeClass('selected');
    $(this).addClass('selected');
    return false;
  });

});
