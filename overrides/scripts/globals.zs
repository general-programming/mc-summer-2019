import crafttweaker.item.IIngredient;

#priority 1000

global mobIngredient as function(string) IIngredient = function(mobID as string) as IIngredient {
	return <enderio:item_soul_vial:1>.withTag({entityId: mobID}).giveBack(<enderio:item_soul_vial:0>)
		| <extrautils2:goldenlasso:1>.withTag({Animal: {id: mobID}}).giveBack(<extrautils2:goldenlasso:1>)
		| <extrautils2:goldenlasso:0>.withTag({Animal: {id: mobID}}).giveBack(<extrautils2:goldenlasso:0>)
		| <thermalexpansion:morb:0>.withTag({id: mobID})
		| <thermalexpansion:morb:1>.withTag({id: mobID}).giveBack(<thermalexpansion:morb:1>);
};
