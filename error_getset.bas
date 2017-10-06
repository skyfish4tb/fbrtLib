/' runtime error handling, set & get '/

#include "fb.bi"

extern "C"
function fb_ErrorGetNum FBCALL ( ) as long
	dim as FB_ERRORCTX ptr ctx = _FB_TLSGETCTX( ERROR )
	return ctx->err_num
end function

function fb_ErrorSetNum FBCALL ( err_num as long ) as long
	dim as FB_ERRORCTX ptr ctx = _FB_TLSGETCTX( ERROR )
	ctx->err_num = err_num
	return err_num
end function


function fb_ErrorGetLineNum FBCALL ( ) as long
	dim as FB_ERRORCTX ptr ctx = _FB_TLSGETCTX( ERROR )
	return ctx->line_num
end function


function fb_ErrorGetModName FBCALL ( ) as ubyte ptr
	dim as FB_ERRORCTX ptr ctx = _FB_TLSGETCTX( ERROR )
	return ctx->mod_name
end function


function fb_ErrorSetModName FBCALL ( mod_name as ubyte const ptr ) as ubyte ptr
	dim as FB_ERRORCTX ptr ctx = _FB_TLSGETCTX( ERROR )
	dim as ubyte ptr old_name = ctx->mod_name
	ctx->mod_name = mod_name
	return old_name
end function


function fb_ErrorGetFuncName FBCALL ( ) as ubyte ptr
	dim as FB_ERRORCTX ptr ctx = _FB_TLSGETCTX( ERROR )
	return ctx->fun_name
end function


function fb_ErrorSetFuncName FBCALL ( fun_name as ubyte const ptr ) as ubyte ptr
	dim as FB_ERRORCTX ptr ctx = _FB_TLSGETCTX( ERROR )
	dim as ubyte ptr old_name = ctx->fun_name
	ctx->fun_name = fun_name
	return old_name
end function
end extern