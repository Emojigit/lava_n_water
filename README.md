# Once upon a time, there was a incident...
That was a long time ago, when somebody placed a bucket of water, and then lava, on a tall mountain near urban areas. The liquid created a swarm of lavastones wherever it flowed, and when the moderators arrived, they couldn't clear them all with their [adeptus powers](https://content.minetest.net/packages/sfan5/worldedit/)<!-- Well, even Morax, the Geo Archon, cannot help... --> and had to dig them one by one with their pickaxe.

Why can't adeptus powers be used? That’s because if //replace all the stones with air, the entire tall mountain where the incident starts will be hollowed out, and that was not what the moderators wanted to see.

Using this mod, all lavastones will be "tagged,"  so that WorldEdit or other world cleanup tools can identify them and only clear them. Moderators can then use //replace lnw air to clear all lavastones. By removing the liquid sources before executing this command, this should clear up any disasters.

## Technical Details
This mod registers one node, `lava_n_water:lava_water_aftermath_stone`, which is the lavastone. When flowing lava contact water, it will cool down into this form of stone instead of normal stone.

Three alias, `lava_n_water`, `lavawater`, and `lnw`, are registered to point to the said node. This is for easier cleanup with WorldEdit.
