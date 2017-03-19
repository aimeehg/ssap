 $( document ).ready(function() {
      $.ajax({	
				type : 'POST',
				url  : '../php/todos_profesores.php',
                dataType: 'json',
				success :  function(data){						
						//
                       
                          //console.log(data);
                         // console.log("dddd");
                                     $.each(data, function(index) {
                                       //console.log(data[index]);
                                     $("#proflista").append('<li><span id='+data[index].id+' class="text-green" data-toggle="modal" data-target="#myModal" onclick="clickHandler(this);">'+data[index].nombre +' '+data[index].paterno+' '+ data[index].materno+'</span></a></li>');  
                            //          console.log("ño");
                                      
                       
                                        });
                       //console.log("ño2");
						   }
                           
				});

 $('#myModal').on('hidden.bs.modal', function () {
  // do something…
 
})
   
    });
function clickHandler(object) {
      
   // alert(object.id);
    $('#myModal').on('show.bs.modal', function (e) {
       
 //$("#asesorias").empty();
 // $('#nombre').text(object.id);

  $.ajax({	
				type : 'POST',
				url  : '../php/datos_profesor.php',
                dataType: 'json',
                data:{id:object.id},
				success :  function(data){						
						//
                        $('#email').text(data.email);
                        $('#cub').text(data.num_cub);
                        $('#tel').text(data.ext_tel);
     
						   }
                           
				});

 $.ajax({	
				type : 'POST',
				url  : '../php/asesorias.php',
                dataType: 'json',
                data:{id:object.id},
				success :  function(data){						
					
                           $("#tbody").empty();
                    
                  
                          $.each(data, function(index) {
                            //console.log(data[index]);
                            var newRowContent = '<tr><td>'+data[index].dia+'</td><td>'+data[index].hora+'</td></tr>';
                     
                         $("#tbody").append(newRowContent);
                                      
                       
                                        });
						   }
                           
                           
				});

})
}
function cerrar(){
    console.log("cerrar");
 
}