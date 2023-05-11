$('select[data-value]').each(function(index, el) {
	const $el = $(el);

	const defaultValue = $el.attr('data-value').trim();

	if (defaultValue.length > 0) {
		$el.val(defaultValue);
	}
});



$('.popup').click(function() {
	//	$('.layer').css('display','block');
	$('.layer').show();
	$('.layer-bg').show();
});

$('.close-btn').click(function() {
	//	$('.layer').css('display','none');
	$('.layer').hide();
	$('.layer-bg').hide();
});

$('.layer-bg').click(function() {
	//	$('.layer').css('display','none');
	$('.layer').hide();
	$('.layer-bg').hide();
});


//메인 js

var snippet = [].slice.call(document.querySelectorAll('.hover'));
if (snippet.length) {
  snippet.forEach(function (snippet) {
    snippet.addEventListener('mouseout', function (event) {
      if (event.target.parentNode.tagName === 'figure') {
        event.target.parentNode.classList.remove('hover')
      } else {
        event.target.parentNode.classList.remove('hover')
      }
    });
  });
}

//헤드 js

