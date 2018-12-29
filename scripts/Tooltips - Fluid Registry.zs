#=============================#
# Tooltips for Fluid Registry #
#=============================#

import minetweaker.liquid.ILiquidStack;
import minetweaker.liquid.ILiquidDefinition;
import minetweaker.formatting.IFormattedText;

import mods.MTUtils.Utils; // credits to LionZXY

#================================================#
# SETTINGS

// So..?
val TOOLTIPS_ENABLED = 1 as byte;
val BLACKLIST_ENABLED = 1 as byte;
val SHOW_AMOUNT = 1 as byte;
val SHOW_LUMINOCITY = 0 as byte;

val BLACKLIST_BY_LIQUID = [
	// Minecraft
	"potion.awkward",
	"potion.thick",
	"potion.mundane",
	"potion.regen",
	"potion.speed",
	"potion.fireresistance",
	"potion.poison",
	"potion.health",
	"potion.nightvision",
	"potion.weakness",
	"potion.strength",
	"potion.slowness",
	"potion.damage",
	"potion.waterbreathing",
	"potion.invisibility",
	"potion.regen.strong",
	"potion.speed.strong",
	"potion.poison.strong",
	"potion.health.strong",
	"potion.strength.strong",
	"potion.damage.strong",
	"potion.regen.long",
	"potion.speed.long",
	"potion.fireresistance.long",
	"potion.poison.long",
	"potion.nightvision.long",
	"potion.weakness.long",
	"potion.strength.long",
	"potion.slowness.long",
	"potion.waterbreathing.long",
	"potion.invisibility.long",
	"potion.regen.splash",
	"potion.speed.splash",
	"potion.fireresistance.splash",
	"potion.poison.splash",
	"potion.health.splash",
	"potion.nightvision.splash",
	"potion.weakness.splash",
	"potion.strength.splash",
	"potion.slowness.splash",
	"potion.damage.splash",
	"potion.waterbreathing.splash",
	"potion.invisibility.splash",
	"potion.regen.strong.splash",
	"potion.speed.strong.splash",
	"potion.poison.strong.splash",
	"potion.health.strong.splash",
	"potion.strength.strong.splash",
	"potion.damage.strong.splash",
	"potion.regen.long.splash",
	"potion.speed.long.splash",
	"potion.fireresistance.long.splash",
	"potion.poison.long.splash",
	"potion.nightvision.long.splash",
	"potion.weakness.long.splash",
	"potion.strength.long.splash",
	"potion.slowness.long.splash",
	"potion.waterbreathing.long.splash",
	"potion.invisibility.long.splash",
	// Forestry
	"mead",
	// GregTech
	"dye.chemical.dyewhite",
	"dye.chemical.dyeorange",
	"dye.chemical.dyemagenta",
	"dye.chemical.dyelightblue",
	"dye.chemical.dyeyellow",
	"dye.chemical.dyelime",
	"dye.chemical.dyepink",
	"dye.chemical.dyegray",
	"dye.chemical.dyelightgray",
	"dye.chemical.dyecyan",
	"dye.chemical.dyepurple",
	"dye.chemical.dyeblue",
	"dye.chemical.dyebrown",
	"dye.chemical.dyegreen",
	"dye.chemical.dyered",
	"dye.chemical.dyeblack",
] as IFormattedText[];

val BLACKLIST_BY_ITEM = [
	// Minecraft
	"mushroomsoup - minecraft:mushroom_stew",
	"water - minecraft:potion",
	// GregTech
	"fuel - gregtech:gt.metaitem.01:32476 / gregtech:gt.metaitem.01:32479"
] as IFormattedText[];


#================================================#
# FUNCTIONS

function ShowFluidRegistry(BLACKLIST_BY_LIQUID as IFormattedText[], BLACKLIST_BY_ITEM as IFormattedText[], BLACKLIST_ENABLED as byte,
	SHOW_AMOUNT as byte, SHOW_LUMINOCITY as byte) {

	if (BLACKLIST_ENABLED == 1) {
		for Liquid in game.liquids {CheckForBlacklist(Liquid, BLACKLIST_BY_LIQUID, BLACKLIST_BY_ITEM, SHOW_AMOUNT, SHOW_LUMINOCITY);}
	} else {
		for Liquid in game.liquids {AddLiquidInfo(Liquid, SHOW_AMOUNT, SHOW_LUMINOCITY);}
	}
}


function CheckForBlacklist(Liquid as ILiquidDefinition, BLACKLIST_BY_LIQUID as IFormattedText[], BLACKLIST_BY_ITEM as IFormattedText[],
	SHOW_AMOUNT as byte, SHOW_LUMINOCITY as byte) {

	var Continue = 1 as byte; /*
	var Resume = 1 as byte;
	val DataArr */

	for BANNED in BLACKLIST_BY_LIQUID {
		if (Utils.eqString([Liquid.name, Utils.FormattedTextToString(BANNED)]) == true) Continue = 0;
	}
	/*
	if (Continue == 1) {
		for BANNED_ITEM in BLACKLIST_BY_ITEM {
			if (Utils.eqString([Liquid.name, Utils.FormattedTextToString(BANNED_ITEM)]) == false) {
				AddContainerInfo(Liquid, SHOW_AMOUNT, SHOW_LUMINOCITY);
			}
		}
		if (Continue == 1) AddLiquidInfo(Liquid, SHOW_AMOUNT, SHOW_LUMINOCITY);
	} */
	if (Continue == 1) AddLiquidInfo(Liquid, SHOW_AMOUNT, SHOW_LUMINOCITY);
}

/*
function AddContainerInfo(Liquid as ILiquidDefinition, SHOW_AMOUNT as byte, SHOW_LUMINOCITY as byte) {

	var debug = format.darkGray(" <" + Liquid.name + ">") as IFormattedText;

	for Container in Liquid.containers {
        if (Liquid.gaseous == true) {
        	Container.addTooltip(format.blue("State: Gas") + debug);
        } else {
        	Container.addTooltip(format.blue("State: Liquid") + debug);
        }

        Container.addTooltip(format.red("Temperature: ") + format.red(Utils.IntToString(Liquid.temperature)) + format.red(" K"));

        if (SHOW_AMOUNT == 1) {
	        if ((Container.liquid.amount > 0) && (Container.liquid.amount < 1000)) {
	        	Container.addTooltip(format.green("Amount: ") + format.green(Utils.IntToString(Container.liquid.amount)) + format.green(" mB"));
	        }
        }

        if ((SHOW_LUMINOCITY == 1) && (Liquid.luminosity > 0))
        	Container.addTooltip(format.gold("Luminocity: ") + format.gold(Utils.IntToString(Liquid.luminosity)));
	}
} */


function AddLiquidInfo(Liquid as ILiquidDefinition, SHOW_AMOUNT as byte, SHOW_LUMINOCITY as byte) {

	var debug = format.darkGray(" <" + Liquid.name + ">") as IFormattedText;

	for Container in Liquid.containers {
        if (Liquid.gaseous == true) {
        	Container.addTooltip(format.blue("State: Gas") + debug);
        } else {
        	Container.addTooltip(format.blue("State: Liquid") + debug);
        }

        Container.addTooltip(format.red("Temperature: ") + format.red(Utils.IntToString(Liquid.temperature)) + format.red(" K"));

        if (SHOW_AMOUNT == 1) {
	        if ((Container.liquid.amount > 0) && (Container.liquid.amount < 1000)) {
	        	Container.addTooltip(format.green("Amount: ") + format.green(Utils.IntToString(Container.liquid.amount)) + format.green(" mB"));
	        }
        }

        if ((SHOW_LUMINOCITY == 1) && (Liquid.luminosity > 0))
        	Container.addTooltip(format.gold("Luminocity: ") + format.gold(Utils.IntToString(Liquid.luminosity)));
	}
}


#================================================#
# GENERAL

if (TOOLTIPS_ENABLED == 1) {
	Utils.executeCommand("/say \u00A76Reloading \u00A76Fluid \u00A76Registry \u00A76Tooltips.");
	ShowFluidRegistry(BLACKLIST_BY_LIQUID, BLACKLIST_BY_ITEM, BLACKLIST_ENABLED, SHOW_AMOUNT, SHOW_LUMINOCITY);
	Utils.executeCommand("/say \u00A76Done!");
} else {
	Utils.executeCommand("/say \u00A76Fluid \u00A76Registry \u00A76Tooltips \u00A76is \u00A76Disabled.");
}


// by EverybodyLies, June 2018