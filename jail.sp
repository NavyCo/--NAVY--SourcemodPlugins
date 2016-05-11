#include <sourcemod>
#include <tf2_stocks>
public OnPluginStart()
{
	RegAdminCmd("sm_jail", Command_Jail, ADMFLAG_SLAY|ADMFLAG_BAN|ADMFLAG_CHEATS, "sm_jail <#userid|name>");
}
public Action:Command_Jail(client, args)
{
	if (args < 1)
	{
		ReplyToCommand(client, "[-NAVY-] Usage: sm_jail <#userid|name>");
		return Plugin_Handled;
	}
	decl String:Arguments[256];
	GetCmdArgString(Arguments, sizeof(Arguments));
	decl String:arg[65];
	new target = FindTarget(client, arg, true);
	if (target == -1)
	{
		return Plugin_Handled;
	}
	bool isJailed = TF2_IsPlayerInCondition(args, TFCond_HalloweenKartCage)
	if (isJailed == true)
	{
		TF2_RemoveCondition(target, TFCond_HalloweenKartCage)
	}
	else
	{
		TF2_AddCondition(target, TFCond_HalloweenKartCage, TFCondDuration_Infinite, 0)
	}
	return Plugin_Handled;
}
