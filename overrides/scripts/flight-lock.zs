import crafttweaker.item.IItemStack;

#priority 500

// Flight research
global researchFlight as IItemStack = <minecraft:written_book>.withTag({
	title: "§9Flight Research",
	genprog: {
		research: "flight"
	}
});

recipes.addShapeless("genprog_flight_research", researchFlight, [
	<minecraft:book>,
	<minecraft:elytra>.onlyDamageAtMost(10),
	mobIngredient("minecraft:ghast")
], function(out, ins, cInfo) {
	return out.updateTag({
		author: cInfo.player.name
	});
}, null);
