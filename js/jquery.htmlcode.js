

    jQuery.extend({
    
            HTMLEncode: function(stringForEncode) {
  
        return $("<div/>").text(stringForEncode).html();
    
    },

    HTMLDecode: function(stringForDecode) {
    
        return $("<textarea/>").html(stringForDecode).val();
 
    }
 
    });
