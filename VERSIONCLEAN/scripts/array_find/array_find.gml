// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_find(_array, _val){
	 var len = array_length(_array);
    var index = noone;
    for (var i = 0; i < len; ++i) {
        if(_array[i] == _val)
        {
            index = i;
            return index;
        }
        else
        {
            index = noone;
        }
    }
    return index;
}