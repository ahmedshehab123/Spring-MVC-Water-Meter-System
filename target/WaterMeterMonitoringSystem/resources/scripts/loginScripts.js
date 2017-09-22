/**
 * 
 */


$(function(){
	
	$("#tb2").hide();
	$("#tb3").hide();
	$("#btnlogin").click(function(){
        $("#tb1").hide();
        $("#tb2").show();
    });
	$("#btnsign").click(function(){
        $("#tb1").hide();
        $("#tb3").show();
    });
	$("#btnbacksignup").click(function(){
        $("#tb1").show();
        $("#tb3").hide();
    });
	$("#btnbacklogin").click(function(){
        $("#tb1").show();
        $("#tb2").hide();
    });
});