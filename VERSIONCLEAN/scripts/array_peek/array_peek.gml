// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_peek(_array){
    if (array_length(_array) > 0)
    {
        return _array[array_length(_array)-1];
    }
    else
    {
        return noone;
    }
}