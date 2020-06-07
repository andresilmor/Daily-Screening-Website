function submitform() {
    document.myForm.submit.click();
}

function callAPI() {
    var jsarray = new Array();
	var url = 'http://newsapi.org/v2/top-headlines?' +
    'country=us&' +
    'category=health&' +
    'apiKey=a077cce8669540e2bafbef040f6529d3';
    var req = new Request(url);
    fetch(req)
    .then(response => response.json())
    .then(data => {
        jsarray = data.articles
        submitform()
    })
    .catch(console.error)	 

	$(document).ready(function(){
		$("#btn").click( function() {
			$.post( $("#myForm").attr("action"),
				 $('#str').val(JSON.stringify(jsarray)),  
		         //$("#myForm :input").serializeArray(), 
		         function(info){ $("#result").html(info); 
                 
			});
		});
		 
	});
}