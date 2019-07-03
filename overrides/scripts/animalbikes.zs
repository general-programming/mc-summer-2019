import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

recipes.removeByRecipeName("thermalfoundation:saddle");

val saddle = <minecraft:saddle>;
static flyingSaddle = <minecraft:saddle>.withDisplayName("§fFlying Saddle").withLore(["§7Used to ride flying creatures."]).updateTag({
	genprog: {
		flyingSaddle: 1 as byte
	}
});

// TODO
recipes.addShaped("genprog_flying_saddle", flyingSaddle, [
	[null, <extrautils2:chickenring:1>, null],
	[<minecraft:elytra>.onlyDamageAtMost(10), saddle, null],
	[null, researchFlight.reuse(), null]
]);

function addSimpleRide(ride as IItemStack, mob as IIngredient, essence as IIngredient, food as IIngredient) {
	addSimpleRideExtra(ride, mob, essence, food, food);
}

function addSimpleRideExtra(ride as IItemStack, mob as IIngredient, essence as IIngredient, food as IIngredient, extra as IIngredient) {
	recipes.addShaped("animalbikes_" + ride.name, ride, [
		[essence, extra, essence],
		[food, <minecraft:saddle>, food],
		[essence, mob, essence]
	]);
}

function addFlyingRide(ride as IItemStack, mob as IIngredient, essence as IIngredient, food as IIngredient) {
	addFlyingRideExtra(ride, mob, essence, food, food);
}

function addFlyingRideExtra(ride as IItemStack, mob as IIngredient, essence as IIngredient, food as IIngredient, extra as IIngredient) {
	recipes.addShaped("animalbikes_" + ride.name, ride, [
		[essence, extra, essence],
		[food, flyingSaddle, food],
		[essence, mob, essence]
	]);
}

// ------------
// Simple rides
// ------------
// TODO: should these really require essence? maybe just a tier 1?

// TODO: don't require saddle for pigs that already have a saddle
recipes.removeByRecipeName("animalbikes:pigbike_0"); // spawns kids.
addSimpleRide(<animalbikes:pigbike>, mobIngredient("minecraft:pig"), <mysticalagriculture:pig_essence>, <minecraft:carrot> | <minecraft:potato> | <minecraft:beetroot>);

recipes.removeByRecipeName("animalbikes:cowbike_0"); // 2 block jump, spawns kids.
addSimpleRide(<animalbikes:cowbike>, mobIngredient("minecraft:cow"), <mysticalagriculture:cow_essence>, <minecraft:wheat>);

recipes.removeByRecipeName("animalbikes:sheepbike_0"); // 20% faster, spawns kids.
addSimpleRide(<animalbikes:sheepbike>, mobIngredient("minecraft:sheep"), <mysticalagriculture:sheep_essence>, <minecraft:wheat>);

recipes.removeByRecipeName("animalbikes:creeperbike_0"); // has a chance of blowing up on damage.
addSimpleRide(<animalbikes:creeperbike>, mobIngredient("minecraft:creeper"), <mysticalagriculture:creeper_essence>, <minecraft:tnt>);

recipes.removeByRecipeName("animalbikes:snowgolembike_0"); // step, snow trail, shoots snowballs,
addSimpleRide(<animalbikes:snowgolembike>, mobIngredient("minecraft:snowman"), <mysticalagriculture:ice_essence>, <minecraft:snowball>);

recipes.removeByRecipeName("animalbikes:polarbearbike_0"); // fast after 5s.
addSimpleRide(<animalbikes:polarbearbike>, mobIngredient("minecraft:polar_bear"), <mysticalagriculture:ice_essence>, <minecraft:fish:1>);

// ------------
// Useful rides
// ------------

recipes.removeByRecipeName("animalbikes:wolfbike_0"); // straight up wolf.
// TODO: wolf essence doesn't exist. use skeleton essence instead? some kind of a collar, maybe?
// TODO: only allow tamed wolves? :3
// addSimpleRide(<animalbikes:wolfbike>, mobIngredient("minecraft:wolf"), <minecraft:bone>, <minecraft:bone>);

recipes.removeByRecipeName("animalbikes:spiderbike_0"); // wall climb.
addSimpleRide(<animalbikes:spiderbike>, mobIngredient("minecraft:spider"), <mysticalagriculture:spider_essence>, <minecraft:spider_eye>);

recipes.removeByRecipeName("animalbikes:squidbike_0"); // better boat.
// TODO: no squid essence.
// addSimpleRide(<animalbikes:squidbike>, mobIngredient("minecraft:squid"), <mysticalagriculture:squid_essence>, <minecraft:dye:0>);

recipes.removeByRecipeName("animalbikes:enderbike_0"); // teleports you around. end
addSimpleRide(<animalbikes:enderbike>, mobIngredient("minecraft:enderman"), <mysticalagriculture:enderman_essence>, <minecraft:water_bucket>.giveBack(<minecraft:bucket>));

recipes.removeByRecipeName("animalbikes:notchbike_0"); // vomits apples, tries to eat you. apple tree sapling
recipes.addShaped("animalbikes_notchbike", <animalbikes:notchbike>, [
	[<minecraft:golden_apple>, <rustic:sapling_apple>, <minecraft:golden_apple>],
	[<opencomputers:keyboard>, saddle, <minecraft:grass>],
	[<minecraft:golden_apple>, <ore:skullZombie>, <minecraft:golden_apple>]
]);

recipes.removeByRecipeName("animalbikes:irongolembike_0"); // step, attacks nearby entities (8-14 dmg).
addSimpleRide(<animalbikes:irongolembike>, mobIngredient("minecraft:villager_golem"), <mysticalagriculture:iron_essence>, <minecraft:red_flower>);

recipes.removeByRecipeName("animalbikes:bunnybike_0"); // spawns eggs and "surprises".
addSimpleRideExtra(<animalbikes:bunnybike>, mobIngredient("minecraft:rabbit"), <mysticalagriculture:rabbit_essence>, <minecraft:carrot>, mobIngredient("minecraft:chicken"));

recipes.removeByRecipeName("animalbikes:chocobobike_0"); // step, faster (carrot), plays Chocarena by Draggor. golden carrots, other veggies?
addSimpleRide(<animalbikes:chocobobike>, <openblocks:golden_egg>, null, <minecraft:golden_carrot>);

recipes.removeByRecipeName("animalbikes:silverfishbike_0"); // mines when holding pickaxe.
// TODO: no idea
recipes.addShaped("animalbikes_silverfishbike", <animalbikes:silverfishbike>, [
	[saddle],
	[mobIngredient("minecraft:silverfish")]
]);

recipes.removeByRecipeName("animalbikes:slimebike_0"); // jumps higher and higher. magma
addSimpleRideExtra(<animalbikes:slimebike>, mobIngredient("minecraft:slime"), <mysticalagriculture:slime_essence>, <minecraft:magma>, <minecraft:magma_cream>);

recipes.removeByRecipeName("animalbikes:ocelotbike_0"); // spawns 3 ocelots.
addSimpleRide(<animalbikes:ocelotbike>, mobIngredient("minecraft:ocelot"), <mysticalagriculture:nature_essence>, <ore:fish>);

recipes.removeByRecipeName("animalbikes:chickenbike_0"); // slow falling, faster, spawns kids.
// TODO: nerf?
addSimpleRide(
	<animalbikes:chickenbike>, mobIngredient("minecraft:chicken"), <mysticalagriculture:chicken_essence>,
	<minecraft:wheat_seeds> | <minecraft:pumpkin_seeds> | <minecraft:melon_seeds> | <minecraft:beetroot_seeds> | <minecraft:nether_wart>
);

// ------------
// Flying rides
// ------------

recipes.removeByRecipeName("animalbikes:ponybike_0"); // horn, wings, rainbows?
val ponyFood = <minecraft:golden_apple> | <minecraft:golden_carrot>;
recipes.addShaped("animalbikes_ponybike", <animalbikes:ponybike>, [
	[<mysticalagriculture:diamond_essence>, <botania:cosmetic:18>, <mysticalagriculture:diamond_essence>],
	[ponyFood, flyingSaddle, ponyFood],
	[<simplyjetpacks:metaitem:3>, mobIngredient("minecraft:horse"), <simplyjetpacks:metaitem:3>]
]);

recipes.removeByRecipeName("animalbikes:dragonbike_0"); // breathes fire (flint and steel). fire resistance
// TODO: ???

recipes.removeByRecipeName("animalbikes:raindeerbike_0"); // snow particles.
// TODO: ???

recipes.removeByRecipeName("animalbikes:ghastbike_0"); // nether only, shoots fireballs (gunpowder).
// TODO: could be improved
addFlyingRideExtra(<animalbikes:ghastbike>, mobIngredient("minecraft:ghast"), <mysticalagriculture:ghast_essence>, <minecraft:fire_charge>, <mysticalagriculture:nether_essence>);

recipes.removeByRecipeName("animalbikes:dinobike_0"); // step, flies, picks up animals.
// TODO: ???

recipes.removeByRecipeName("animalbikes:batbike_0"); // night vision. night vision potion
recipes.addShaped("animalbikes_batbike", <animalbikes:batbike>, [
	[flyingSaddle],
	[mobIngredient("minecraft:bat")]
]);

recipes.removeByRecipeName("animalbikes:chinesedragonbike_0"); // fireworks.
// TODO: ???

recipes.removeByRecipeName("animalbikes:flowerbike_0"); // flies slow. botania?
val daffomill = <botania:floatingspecialflower>.withTag({type: "daffomill"});
recipes.addShaped("animalbikes_flowerbike", <animalbikes:flowerbike>, [
	[null, <botania:specialflower>.withTag({type: "agricarnation"}), null],
	[null, flyingSaddle, null],
	[daffomill, daffomill, daffomill]
]);

recipes.removeByRecipeName("animalbikes:witherbike_0"); // shoots fucking wither skulls (when bow shot).
// wither can't be picked up with lassos/vials/morbs, so that's nice
addFlyingRide(<animalbikes:witherbike>, <minecraft:nether_star>, <mysticalagriculture:nether_essence>, <ore:skullWitherSkeleton>);
