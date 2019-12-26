#include <amxmodx>
#include <orpheu>
#include <hlsdk_const>

#define VERSION "1.7.2"

new Float:oldMaxSpeed
new OrpheuStruct:ppmove

public plugin_init()
{
	register_plugin("axn bhop", VERSION, "aportner & ConnorMcLeod")
	new szVersion[12]
	formatex(szVersion, charsmax(szVersion), "%s_Orpheu", VERSION)
	register_cvar("axn_version", szVersion, FCVAR_SERVER|FCVAR_EXTDLL|FCVAR_SPONLY)

	OrpheuRegisterHook(OrpheuGetFunction("PM_Move"), "onPMMovePre", OrpheuHookPre)
	OrpheuRegisterHook(OrpheuGetFunction("PM_Jump"), "onPMJumpPre", OrpheuHookPre)
	OrpheuRegisterHook(OrpheuGetFunction("PM_Jump"), "onPMJumpPost", OrpheuHookPost)
	
//	OrpheuRegisterHook(OrpheuGetFunction("PM_PlayerMove"), "onPMPlayerMovePre", OrpheuHookPre)
	OrpheuRegisterHook(OrpheuGetFunction("PM_Duck"), "onPMDuckPost", OrpheuHookPost)
}

public onPMMovePre(OrpheuStruct:pmove,server)
{
	ppmove = pmove
}

public onPMJumpPre()
{
	// bhop acceleration
	oldMaxSpeed = Float:OrpheuGetStructMember(ppmove, "maxspeed")
	OrpheuSetStructMember(ppmove, "maxspeed", 0.0)
}

public onPMJumpPost()
{
	// remove fuser2 slowdown
	OrpheuSetStructMember(ppmove, "fuser2", 0.0)

	// restore maxspeed from acceleration
	OrpheuSetStructMember(ppmove, "maxspeed", oldMaxSpeed)
}

/*public onPMPlayerMovePre()
{
	
}*/

public onPMDuckPost()
{
	if(	OrpheuGetStructMember(ppmove, "onground") != -1
	&&	OrpheuGetStructMember(OrpheuStruct:OrpheuGetStructMember( ppmove, "cmd" ), "buttons" ) & IN_USE	)
	{
		new Float:fVecVelocity[3]
		OrpheuGetStructMember(ppmove, "velocity", fVecVelocity)
		fVecVelocity[0] *= 0.3
		fVecVelocity[1] *= 0.3
		fVecVelocity[2] *= 0.3
		OrpheuSetStructMember(ppmove, "velocity", fVecVelocity)
	}
}