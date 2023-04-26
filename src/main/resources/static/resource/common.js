$('select[data-value]').each(function(index, el){
	const $el = $(el);
	
	const defaultValue = $el.attr('data-value').trim();
	
	if(defaultValue.lenth > 0){
		$el.val(defaultValue);
	}
});