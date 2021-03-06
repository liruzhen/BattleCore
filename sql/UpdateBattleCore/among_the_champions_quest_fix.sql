-- Add SAI support for Lance a Lot achievement ID: 2836 and Amongts the Champions  quest
-- Champions SAI mechanic
SET @Sen_Champion := 33745;
SET @Script := 3374500;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@Sen_Champion;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Sen_Champion;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@Script;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Sen_Champion,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen Champion - On Reset - Remove auras from Defend'),
(@Sen_Champion,0,1,2,62,0,100,0,10458,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sen Champion - On gossip select - Close gossip'),
(@Sen_Champion,0,2,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0,'Sen Champion - Linked with previous event - Call timed actionlist'),
(@Sen_Champion,0,3,0,52,0,100,0,0,@Sen_Champion,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sen Champion - On text over - Cast Charge'),
(@Sen_Champion,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,'Sen Champion - IC - Cast Thrust'),
(@Sen_Champion,0,5,0,9,0,100,0,5,5,4000,7000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'Sen Champion - On more than 5 yard range - Cast Shield-Breaker'),
(@Sen_Champion,0,6,0,0,0,100,0,9000,11000,9000,10000,46,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen Champion - IC - Move forward 12 yards'),
(@Sen_Champion,0,7,8,9,0,100,0,9,15,3000,3000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,'Sen Champion - On 10-12 yard range - Cast Charge'),
(@Sen_Champion,0,8,0,61,0,100,0,0,0,0,0,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'Sen Champion - Linked with previous event - Cast Shield-Breaker'),
(@Sen_Champion,0,9,10,2,0,100,1,1,6,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen Champion - On HP% between 1% and 6% - Change faction to 35'),
(@Sen_Champion,0,10,11,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen Champion - Linked with previous event - Say text'),
(@Sen_Champion,0,11,12,61,0,100,0,0,0,0,0,85,63596,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sen Champion - Linked with previous event - Cast Mounted Melee Victory /item/'),
(@Sen_Champion,0,12,0,61,0,100,0,0,0,0,0,85,64812,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen Champion - Linked with previous event - Cast credit'),
(@Sen_Champion,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen Champion - On player killed - Say text'),
(@Sen_Champion,0,14,15,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen Champion - Linked with previous event - Set unseen'),
(@Sen_Champion,0,15,0,61,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sen Champion - Linked with previous event - Despawn in 1 ms'),
-- Timed actionlist 1
(@Script,9,1,0,0,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Set run ON'),
(@Script,9,2,0,0,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Set run ON'),
(@Script,9,3,0,0,0,100,0,0,0,0,0,11,62719,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Cast Defend on self/Layer 1/'),
(@Script,9,4,0,0,0,100,0,0,0,0,0,11,62719,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Cast Defend on self/Layer 2/'),
(@Script,9,5,0,0,0,100,0,0,0,0,0,46,20,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Move forward 15 yards'),
(@Script,9,6,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Set run Off'),
(@Script,9,7,0,0,0,100,0,0,0,0,0,11,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Cast aura TriggerS for Defend /10 sec one/'),
(@Script,9,8,0,0,0,100,0,3500,3500,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Change faction to 14'),
(@Script,9,9,0,0,0,100,0,0,0,0,0,1,0,1500,0,0,0,0,2,0,0,0,0,0,0,0,'All champions - Script 1 - Say text');
-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @Sen_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@Sen_Champion,0,0,'Ready yourself!',12,1,100,0,0,0,'Argent Champion', 33757),
(@Sen_Champion,0,1,'Prepare yourself!',12,1,100,0,0,0,'Argent Champion', 33755),
(@Sen_Champion,0,2,'On your guard!',12,1,100,0,0,0,'Argent Champion', 33756),
(@Sen_Champion,0,3,'Let it begin!',12,1,100,0,0,0,'Argent Champion', 33758),
(@Sen_Champion,1,0,'Victory is mine!',12,1,100,0,0,0,'Argent Champion', 33777),
(@Sen_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,1,100,0,0,0,'Argent Champion', 33764),
(@Sen_Champion,1,2,'I have won. Better luck another time, friend.',12,1,100,0,0,0,'Argent Champion', 33779),
(@Sen_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,1,100,0,0,0,'Argent Champion', 33778),
(@Sen_Champion,2,0,'I yield to you.',12,1,100,0,0,0,'Argent Champion', 33774),
(@Sen_Champion,2,1,'That was a well fought battle. I yield to you.',12,1,100,0,0,0,'Argent Champion', 33776),
(@Sen_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,1,100,0,0,0,'Argent Champion', 33775),
(@Sen_Champion,2,3,'I have been defeated. Good fight!',12,1,100,0,0,0,'Argent Champion', 33760);

SET @Orgri_Champion := 33744;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@Orgri_Champion;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Orgri_Champion;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Orgri_Champion,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'Orgri Champion - On Reset - Remove auras from Defend'),
(@Orgri_Champion,0,1,2,62,0,100,0,10457,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Orgri Champion - On gossip select - Close gossip'),
(@Orgri_Champion,0,2,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0,'Orgri Champion - Linked with previous event - Call timed actionlist'),
(@Orgri_Champion,0,3,0,52,0,100,0,0,@Orgri_Champion,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,'Orgri Champion - On text over - Cast Charge'),
(@Orgri_Champion,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,'Orgri Champion - IC - Cast Thrust'),
(@Orgri_Champion,0,5,0,9,0,100,0,5,5,9000,10000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'Orgri Champion - On more than 5 yard range - Cast Shield-Breaker'),
(@Orgri_Champion,0,6,0,0,0,100,0,9000,11000,9000,10000,46,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'Orgri Champion - IC - Move forward 12 yards'),
(@Orgri_Champion,0,7,8,9,0,100,0,9,15,3000,3000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,'Orgri Champion - On 10-12 yard range - Cast Charge'),
(@Orgri_Champion,0,8,0,61,0,100,0,0,0,0,0,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'Orgri Champion - Linked with previous event - Cast Shield-Breaker'),
(@Orgri_Champion,0,9,10,2,0,100,1,1,6,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Orgri Champion - On HP% between 1% and 6% - Change faction to 35'),
(@Orgri_Champion,0,10,11,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Orgri Champion - Linked with previous event - Say text'),
(@Orgri_Champion,0,11,12,61,0,100,0,0,0,0,0,85,63596,0,0,0,0,0,7,0,0,0,0,0,0,0,'Orgri Champion - Linked with previous event - Cast Mounted Melee Victory /item/'),
(@Orgri_Champion,0,12,0,61,0,100,0,0,0,0,0,85,64811,0,0,0,0,0,1,0,0,0,0,0,0,0,'Orgri Champion - Linked with previous event - Cast credit'),
(@Orgri_Champion,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Orgri Champion - On player killed - Say text'),
(@Orgri_Champion,0,14,15,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Orgri Champion - Linked with previous event - Set unseen'),
(@Orgri_Champion,0,15,0,61,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Orgri Champion - Linked with previous event - Despawn in 1 ms');
-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @Orgri_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@Orgri_Champion,0,0,'Ready yourself!',12,1,100,0,0,0,'Argent Champion', 33757),
(@Orgri_Champion,0,1,'Prepare yourself!',12,1,100,0,0,0,'Argent Champion', 33755),
(@Orgri_Champion,0,2,'On your guard!',12,1,100,0,0,0,'Argent Champion', 33756),
(@Orgri_Champion,0,3,'Let it begin!',12,1,100,0,0,0,'Argent Champion', 33758),
(@Orgri_Champion,1,0,'Victory is mine!',12,1,100,0,0,0,'Argent Champion', 33777),
(@Orgri_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,1,100,0,0,0,'Argent Champion', 33764),
(@Orgri_Champion,1,2,'I have won. Better luck another time, friend.',12,1,100,0,0,0,'Argent Champion', 33779),
(@Orgri_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,1,100,0,0,0,'Argent Champion', 33778),
(@Orgri_Champion,2,0,'I yield to you.',12,1,100,0,0,0,'Argent Champion', 33774),
(@Orgri_Champion,2,1,'That was a well fought battle. I yield to you.',12,1,100,0,0,0,'Argent Champion', 33776),
(@Orgri_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,1,100,0,0,0,'Argent Champion', 33775),
(@Orgri_Champion,2,3,'I have been defeated. Good fight!',12,1,100,0,0,0,'Argent Champion', 33760);
SET @TB_Champion := 33748;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@TB_Champion;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@TB_Champion;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@TB_Champion,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'TB Champion - On Reset - Remove auras from Defend'),
(@TB_Champion,0,1,2,62,0,100,0,10461,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'TB Champion - On gossip select - Close gossip'),
(@TB_Champion,0,2,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0,'TB Champion - Linked with previous event - Call timed actionlist'),
(@TB_Champion,0,3,0,52,0,100,0,0,@TB_Champion,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,'TB Champion - On text over - Cast Charge'),
(@TB_Champion,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,'TB Champion - IC - Cast Thrust'),
(@TB_Champion,0,5,0,9,0,100,0,5,5,9000,10000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'TB Champion - On more than 5 yard range - Cast Shield-Breaker'),
(@TB_Champion,0,6,0,0,0,100,0,9000,11000,9000,10000,46,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'TB Champion - IC - Move forward 12 yards'),
(@TB_Champion,0,7,8,9,0,100,0,9,15,3000,3000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,'TB Champion - On 10-12 yard range - Cast Charge'),
(@TB_Champion,0,8,0,61,0,100,0,0,0,0,0,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'TB Champion - Linked with previous event - Cast Shield-Breaker'),
(@TB_Champion,0,9,10,2,0,100,1,1,6,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'TB Champion - On HP% between 1% and 6% - Change faction to 35'),
(@TB_Champion,0,10,11,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'TB Champion - Linked with previous event - Say text'),
(@TB_Champion,0,11,12,61,0,100,0,0,0,0,0,85,63596,0,0,0,0,0,7,0,0,0,0,0,0,0,'TB Champion - Linked with previous event - Cast Mounted Melee Victory /item/'),
(@TB_Champion,0,12,0,61,0,100,0,0,0,0,0,85,64815,0,0,0,0,0,1,0,0,0,0,0,0,0,'TB Champion - Linked with previous event - Cast credit'),
(@TB_Champion,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'TB Champion - On player killed - Say text'),
(@TB_Champion,0,14,15,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'TB Champion - Linked with previous event - Set unseen'),
(@TB_Champion,0,15,0,61,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'TB Champion - Linked with previous event - Despawn in 1 ms');
-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @TB_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@TB_Champion,0,0,'Ready yourself!',12,1,100,0,0,0,'Argent Champion', 33757),
(@TB_Champion,0,1,'Prepare yourself!',12,1,100,0,0,0,'Argent Champion', 33755),
(@TB_Champion,0,2,'On your guard!',12,1,100,0,0,0,'Argent Champion', 33756),
(@TB_Champion,0,3,'Let it begin!',12,1,100,0,0,0,'Argent Champion', 33758),
(@TB_Champion,1,0,'Victory is mine!',12,1,100,0,0,0,'Argent Champion', 33777),
(@TB_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,1,100,0,0,0,'Argent Champion', 33764),
(@TB_Champion,1,2,'I have won. Better luck another time, friend.',12,1,100,0,0,0,'Argent Champion', 33779),
(@TB_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,1,100,0,0,0,'Argent Champion', 33778),
(@TB_Champion,2,0,'I yield to you.',12,1,100,0,0,0,'Argent Champion', 33774),
(@TB_Champion,2,1,'That was a well fought battle. I yield to you.',12,1,100,0,0,0,'Argent Champion', 33776),
(@TB_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,1,100,0,0,0,'Argent Champion', 33775),
(@TB_Champion,2,3,'I have been defeated. Good fight!',12,1,100,0,0,0,'Argent Champion', 33760);
SET @SM_Champion := 33746;
UPDATE `creature_template` SET `AIName`='SmartAI'  WHERE `entry`=@SM_Champion;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SM_Champion;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SM_Champion,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'SM Champion - On Reset - Remove auras from Defend'),
(@SM_Champion,0,1,2,62,0,100,0,10459,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'SM Champion - On gossip select - Close gossip'),
(@SM_Champion,0,2,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0,'SM Champion - Linked with previous event - Call timed actionlist'),
(@SM_Champion,0,3,0,52,0,100,0,0,@SM_Champion,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,'SM Champion - On text over - Cast Charge'),
(@SM_Champion,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,'SM Champion - IC - Cast Thrust'),
(@SM_Champion,0,5,0,9,0,100,0,5,5,9000,10000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'SM Champion - On more than 5 yard range - Cast Shield-Breaker'),
(@SM_Champion,0,6,0,0,0,100,0,9000,11000,9000,10000,46,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'SM Champion - IC - Move forward 12 yards'),
(@SM_Champion,0,7,8,9,0,100,0,9,15,3000,3000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,'SM Champion - On 10-12 yard range - Cast Charge'),
(@SM_Champion,0,8,0,61,0,100,0,0,0,0,0,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'SM Champion - Linked with previous event - Cast Shield-Breaker'),
(@SM_Champion,0,9,10,2,0,100,1,1,6,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'SM Champion - On HP% between 1% and 6% - Change faction to 35'),
(@SM_Champion,0,10,11,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'SM Champion - Linked with previous event - Say text'),
(@SM_Champion,0,11,12,61,0,100,0,0,0,0,0,85,63596,0,0,0,0,0,7,0,0,0,0,0,0,0,'SM Champion - Linked with previous event - Cast Mounted Melee Victory /item/'),
(@SM_Champion,0,12,0,61,0,100,0,0,0,0,0,85,64813,0,0,0,0,0,1,0,0,0,0,0,0,0,'SM Champion - Linked with previous event - Cast credit'),
(@SM_Champion,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'SM Champion - On player killed - Say text'),
(@SM_Champion,0,14,15,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'SM Champion - Linked with previous event - Set unseen'),
(@SM_Champion,0,15,0,61,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'SM Champion - Linked with previous event - Despawn in 1 ms');
-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @SM_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@SM_Champion,0,0,'Ready yourself!',12,1,100,0,0,0,'Argent Champion', 33757),
(@SM_Champion,0,1,'Prepare yourself!',12,1,100,0,0,0,'Argent Champion', 33755),
(@SM_Champion,0,2,'On your guard!',12,1,100,0,0,0,'Argent Champion', 33756),
(@SM_Champion,0,3,'Let it begin!',12,1,100,0,0,0,'Argent Champion', 33758),
(@SM_Champion,1,0,'Victory is mine!',12,1,100,0,0,0,'Argent Champion', 33777),
(@SM_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,1,100,0,0,0,'Argent Champion', 33764),
(@SM_Champion,1,2,'I have won. Better luck another time, friend.',12,1,100,0,0,0,'Argent Champion', 33779),
(@SM_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,1,100,0,0,0,'Argent Champion', 33778),
(@SM_Champion,2,0,'I yield to you.',12,1,100,0,0,0,'Argent Champion', 33774),
(@SM_Champion,2,1,'That was a well fought battle. I yield to you.',12,1,100,0,0,0,'Argent Champion', 33776),
(@SM_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,1,100,0,0,0,'Argent Champion', 33775),
(@SM_Champion,2,3,'I have been defeated. Good fight!',12,1,100,0,0,0,'Argent Champion', 33760);
SET @GR_Champion := 33740;
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@GR_Champion;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GR_Champion;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GR_Champion,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'GR Champion - On Reset - Remove auras from Defend'),
(@GR_Champion,0,1,2,62,0,100,0,10455,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'GR Champion - On gossip select - Close gossip'),
(@GR_Champion,0,2,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0,'GR Champion - Linked with previous event - Call timed actionlist'),
(@GR_Champion,0,3,0,52,0,100,0,0,@GR_Champion,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,'GR Champion - On text over - Cast Charge'),
(@GR_Champion,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,'GR Champion - IC - Cast Thrust'),
(@GR_Champion,0,5,0,9,0,100,0,5,5,9000,10000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'GR Champion - On more than 5 yard range - Cast Shield-Breaker'),
(@GR_Champion,0,6,0,0,0,100,0,9000,11000,9000,10000,46,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'GR Champion - IC - Move forward 12 yards'),
(@GR_Champion,0,7,8,9,0,100,0,9,15,3000,3000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,'GR Champion - On 10-12 yard range - Cast Charge'),
(@GR_Champion,0,8,0,61,0,100,0,0,0,0,0,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'GR Champion - Linked with previous event - Cast Shield-Breaker'),
(@GR_Champion,0,9,10,2,0,100,1,1,6,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'GR Champion - On HP% between 1% and 6% - Change faction to 35'),
(@GR_Champion,0,10,11,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'GR Champion - Linked with previous event - Say text'),
(@GR_Champion,0,11,12,61,0,100,0,0,0,0,0,85,63596,0,0,0,0,0,7,0,0,0,0,0,0,0,'GR Champion - Linked with previous event - Cast Mounted Melee Victory /item/'),
(@GR_Champion,0,12,0,61,0,100,0,0,0,0,0,85,64809,0,0,0,0,0,1,0,0,0,0,0,0,0,'GR Champion - Linked with previous event - Cast credit'),
(@GR_Champion,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'GR Champion - On player killed - Say text'),
(@GR_Champion,0,14,15,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'GR Champion - Linked with previous event - Set unseen'),
(@GR_Champion,0,15,0,61,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'GR Champion - Linked with previous event - Despawn in 1 ms');
-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @GR_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@GR_Champion,0,0,'Ready yourself!',12,7,100,0,0,0,'Argent Champion', 33757),
(@GR_Champion,0,1,'Prepare yourself!',12,7,100,0,0,0,'Argent Champion', 33755),
(@GR_Champion,0,2,'On your guard!',12,7,100,0,0,0,'Argent Champion', 33756),
(@GR_Champion,0,3,'Let it begin!',12,7,100,0,0,0,'Argent Champion', 33758),
(@GR_Champion,1,0,'Victory is mine!',12,7,100,0,0,0,'Argent Champion', 33777),
(@GR_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,7,100,0,0,0,'Argent Champion', 33764),
(@GR_Champion,1,2,'I have won. Better luck another time, friend.',12,7,100,0,0,0,'Argent Champion', 33779),
(@GR_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,7,100,0,0,0,'Argent Champion', 33778),
(@GR_Champion,2,0,'I yield to you.',12,7,100,0,0,0,'Argent Champion', 33774),
(@GR_Champion,2,1,'That was a well fought battle. I yield to you.',12,7,100,0,0,0,'Argent Champion', 33776),
(@GR_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,7,100,0,0,0,'Argent Champion', 33775),
(@GR_Champion,2,3,'I have been defeated. Good fight!',12,7,100,0,0,0,'Argent Champion', 33760);
SET @IF_Champion := 33743;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@IF_Champion;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@IF_Champion;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@IF_Champion,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'IF Champion - On Reset - Remove auras from Defend'),
(@IF_Champion,0,1,2,62,0,100,0,10456,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'IF Champion - On gossip select - Close gossip'),
(@IF_Champion,0,2,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0,'IF Champion - Linked with previous event - Call timed actionlist'),
(@IF_Champion,0,3,0,52,0,100,0,0,@IF_Champion,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,'IF Champion - On text over - Cast Charge'),
(@IF_Champion,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,'IF Champion - IC - Cast Thrust'),
(@IF_Champion,0,5,0,9,0,100,0,5,5,9000,10000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'IF Champion - On more than 5 yard range - Cast Shield-Breaker'),
(@IF_Champion,0,6,0,0,0,100,0,9000,11000,9000,10000,46,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'IF Champion - IC - Move forward 12 yards'),
(@IF_Champion,0,7,8,9,0,100,0,9,15,3000,3000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,'IF Champion - On 10-12 yard range - Cast Charge'),
(@IF_Champion,0,8,0,61,0,100,0,0,0,0,0,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'IF Champion - Linked with previous event - Cast Shield-Breaker'),
(@IF_Champion,0,9,10,2,0,100,1,1,6,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'IF Champion - On HP% between 1% and 6% - Change faction to 35'),
(@IF_Champion,0,10,11,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'IF Champion - Linked with previous event - Say text'),
(@IF_Champion,0,11,12,61,0,100,0,0,0,0,0,85,63596,0,0,0,0,0,7,0,0,0,0,0,0,0,'IF Champion - Linked with previous event - Cast Mounted Melee Victory /item/'),
(@IF_Champion,0,12,0,61,0,100,0,0,0,0,0,85,64810,0,0,0,0,0,1,0,0,0,0,0,0,0,'IF Champion - Linked with previous event - Cast credit'),
(@IF_Champion,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'IF Champion - On player killed - Say text'),
(@IF_Champion,0,14,15,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'IF Champion - Linked with previous event - Set unseen'),
(@IF_Champion,0,15,0,61,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'IF Champion - Linked with previous event - Despawn in 1 ms');
-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @IF_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@IF_Champion,0,0,'Ready yourself!',12,7,100,0,0,0,'Argent Champion', 33757),
(@IF_Champion,0,1,'Prepare yourself!',12,7,100,0,0,0,'Argent Champion', 33755),
(@IF_Champion,0,2,'On your guard!',12,7,100,0,0,0,'Argent Champion', 33756),
(@IF_Champion,0,3,'Let it begin!',12,7,100,0,0,0,'Argent Champion', 33758),
(@IF_Champion,1,0,'Victory is mine!',12,7,100,0,0,0,'Argent Champion', 33777),
(@IF_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,7,100,0,0,0,'Argent Champion', 33764),
(@IF_Champion,1,2,'I have won. Better luck another time, friend.',12,7,100,0,0,0,'Argent Champion', 33779),
(@IF_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,7,100,0,0,0,'Argent Champion', 33778),
(@IF_Champion,2,0,'I yield to you.',12,7,100,0,0,0,'Argent Champion', 33774),
(@IF_Champion,2,1,'That was a well fought battle. I yield to you.',12,7,100,0,0,0,'Argent Champion', 33776),
(@IF_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,7,100,0,0,0,'Argent Champion', 33775),
(@IF_Champion,2,3,'I have been defeated. Good fight!',12,7,100,0,0,0,'Argent Champion', 33760);
SET @SW_Champion := 33747;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@SW_Champion;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SW_Champion;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SW_Champion,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'SW Champion - On Reset - Remove auras from Defend'),
(@SW_Champion,0,1,2,62,0,100,0,10460,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'SW Champion - On gossip select - Close gossip'),
(@SW_Champion,0,2,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0,'SW Champion - Linked with previous event - Call timed actionlist'),
(@SW_Champion,0,3,0,52,0,100,0,0,@SW_Champion,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,'SW Champion - On text over - Cast Charge'),
(@SW_Champion,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,'SW Champion - IC - Cast Thrust'),
(@SW_Champion,0,5,0,9,0,100,0,5,5,9000,10000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'SW Champion - On more than 5 yard range - Cast Shield-Breaker'),
(@SW_Champion,0,6,0,0,0,100,0,9000,11000,9000,10000,46,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'SW Champion - IC - Move forward 12 yards'),
(@SW_Champion,0,7,8,9,0,100,0,9,15,3000,3000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,'SW Champion - On 10-12 yard range - Cast Charge'),
(@SW_Champion,0,8,0,61,0,100,0,0,0,0,0,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'SW Champion - Linked with previous event - Cast Shield-Breaker'),
(@SW_Champion,0,9,10,2,0,100,1,1,6,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'SW Champion - On HP% between 1% and 6% - Change faction to 35'),
(@SW_Champion,0,10,11,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'SW Champion - Linked with previous event - Say text'),
(@SW_Champion,0,11,12,61,0,100,0,0,0,0,0,85,63596,0,0,0,0,0,7,0,0,0,0,0,0,0,'SW Champion - Linked with previous event - Cast Mounted Melee Victory /item/'),
(@SW_Champion,0,12,0,61,0,100,0,0,0,0,0,85,64814,0,0,0,0,0,1,0,0,0,0,0,0,0,'SW Champion - Linked with previous event - Cast credit'),
(@SW_Champion,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'SW Champion - On player killed - Say text'),
(@SW_Champion,0,14,15,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'SW Champion - Linked with previous event - Set unseen'),
(@SW_Champion,0,15,0,61,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'SW Champion - Linked with previous event - Despawn in 1 ms');
-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @SW_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@SW_Champion,0,0,'Ready yourself!',12,7,100,0,0,0,'Argent Champion', 33757),
(@SW_Champion,0,1,'Prepare yourself!',12,7,100,0,0,0,'Argent Champion', 33755),
(@SW_Champion,0,2,'On your guard!',12,7,100,0,0,0,'Argent Champion', 33756),
(@SW_Champion,0,3,'Let it begin!',12,7,100,0,0,0,'Argent Champion', 33758),
(@SW_Champion,1,0,'Victory is mine!',12,7,100,0,0,0,'Argent Champion', 33777),
(@SW_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,7,100,0,0,0,'Argent Champion', 33764),
(@SW_Champion,1,2,'I have won. Better luck another time, friend.',12,7,100,0,0,0,'Argent Champion', 33779),
(@SW_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,7,100,0,0,0,'Argent Champion', 33778),
(@SW_Champion,2,0,'I yield to you.',12,7,100,0,0,0,'Argent Champion', 33774),
(@SW_Champion,2,1,'That was a well fought battle. I yield to you.',12,7,100,0,0,0,'Argent Champion', 33776),
(@SW_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,7,100,0,0,0,'Argent Champion', 33775),
(@SW_Champion,2,3,'I have been defeated. Good fight!',12,7,100,0,0,0,'Argent Champion', 33760);
SET @Darn_Champion := 33738;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@Darn_Champion;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Darn_Champion;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Darn_Champion,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darn Champion - On Reset - Remove auras from Defend'),
(@Darn_Champion,0,1,2,62,0,100,0,10453,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Darn Champion - On gossip select - Close gossip'),
(@Darn_Champion,0,2,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0,'Darn Champion - Linked with previous event - Call timed actionlist'),
(@Darn_Champion,0,3,0,52,0,100,0,0,@Darn_Champion,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,'Darn Champion - On text over - Cast Charge'),
(@Darn_Champion,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,'Darn Champion - IC - Cast Thrust'),
(@Darn_Champion,0,5,0,9,0,100,0,5,5,9000,10000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'Darn Champion - On more than 5 yard range - Cast Shield-Breaker'),
(@Darn_Champion,0,6,0,0,0,100,0,9000,11000,9000,10000,46,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darn Champion - IC - Move forward 12 yards'),
(@Darn_Champion,0,7,8,9,0,100,0,9,15,3000,3000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,'Darn Champion - On 10-12 yard range - Cast Charge'),
(@Darn_Champion,0,8,0,61,0,100,0,0,0,0,0,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'Darn Champion - Linked with previous event - Cast Shield-Breaker'),
(@Darn_Champion,0,9,10,2,0,100,1,1,6,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darn Champion - On HP% between 1% and 6% - Change faction to 35'),
(@Darn_Champion,0,10,11,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darn Champion - Linked with previous event - Say text'),
(@Darn_Champion,0,11,12,61,0,100,0,0,0,0,0,85,63596,0,0,0,0,0,7,0,0,0,0,0,0,0,'Darn Champion - Linked with previous event - Cast Mounted Melee Victory /item/'),
(@Darn_Champion,0,12,0,61,0,100,0,0,0,0,0,85,64805,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darn Champion - Linked with previous event - Cast credit'),
(@Darn_Champion,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darn Champion - On player killed - Say text'),
(@Darn_Champion,0,14,15,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darn Champion - Linked with previous event - Set unseen'),
(@Darn_Champion,0,15,0,61,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darn Champion - Linked with previous event - Despawn in 1 ms');
-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @Darn_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@Darn_Champion,0,0,'Ready yourself!',12,7,100,0,0,0,'Argent Champion', 33757),
(@Darn_Champion,0,1,'Prepare yourself!',12,7,100,0,0,0,'Argent Champion', 33755),
(@Darn_Champion,0,2,'On your guard!',12,7,100,0,0,0,'Argent Champion', 33756),
(@Darn_Champion,0,3,'Let it begin!',12,7,100,0,0,0,'Argent Champion', 33758),
(@Darn_Champion,1,0,'Victory is mine!',12,7,100,0,0,0,'Argent Champion', 33777),
(@Darn_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,7,100,0,0,0,'Argent Champion', 33764),
(@Darn_Champion,1,2,'I have won. Better luck another time, friend.',12,7,100,0,0,0,'Argent Champion', 33779),
(@Darn_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,7,100,0,0,0,'Argent Champion', 33778),
(@Darn_Champion,2,0,'I yield to you.',12,7,100,0,0,0,'Argent Champion', 33774),
(@Darn_Champion,2,1,'That was a well fought battle. I yield to you.',12,7,100,0,0,0,'Argent Champion', 33776),
(@Darn_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,7,100,0,0,0,'Argent Champion', 33775),
(@Darn_Champion,2,3,'I have been defeated. Good fight!',12,7,100,0,0,0,'Argent Champion', 33760);
SET @Exo_Champion := 33739;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@Exo_Champion;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Exo_Champion;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Exo_Champion,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'Exo Champion - On Reset - Remove auras from Defend'),
(@Exo_Champion,0,1,2,62,0,100,0,10454,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Exo Champion - On gossip select - Close gossip'),
(@Exo_Champion,0,2,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0,'Exo Champion - Linked with previous event - Call timed actionlist'),
(@Exo_Champion,0,3,0,52,0,100,0,0,@Exo_Champion,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,'Exo Champion - On text over - Cast Charge'),
(@Exo_Champion,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,'Exo Champion - IC - Cast Thrust'),
(@Exo_Champion,0,5,0,9,0,100,0,5,5,9000,10000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'Exo Champion - On more than 5 yard range - Cast Shield-Breaker'),
(@Exo_Champion,0,6,0,0,0,100,0,9000,11000,9000,10000,46,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'Exo Champion - IC - Move forward 12 yards'),
(@Exo_Champion,0,7,8,9,0,100,0,9,15,3000,3000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,'Exo Champion - On 10-12 yard range - Cast Charge'),
(@Exo_Champion,0,8,0,61,0,100,0,0,0,0,0,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'Exo Champion - Linked with previous event - Cast Shield-Breaker'),
(@Exo_Champion,0,9,10,2,0,100,1,1,6,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Exo Champion - On HP% between 1% and 6% - Change faction to 35'),
(@Exo_Champion,0,10,11,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Exo Champion - Linked with previous event - Say text'),
(@Exo_Champion,0,11,12,61,0,100,0,0,0,0,0,85,63596,0,0,0,0,0,7,0,0,0,0,0,0,0,'Exo Champion - Linked with previous event - Cast Mounted Melee Victory /item/'),
(@Exo_Champion,0,12,0,61,0,100,0,0,0,0,0,85,64808,0,0,0,0,0,1,0,0,0,0,0,0,0,'Exo Champion - Linked with previous event - Cast credit'),
(@Exo_Champion,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Exo Champion - On player killed - Say text'),
(@Exo_Champion,0,14,15,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Exo Champion - Linked with previous event - Set unseen'),
(@Exo_Champion,0,15,0,61,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Exo Champion - Linked with previous event - Despawn in 1 ms');
-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @Exo_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@Exo_Champion,0,0,'Ready yourself!',12,7,100,0,0,0,'Argent Champion', 33757),
(@Exo_Champion,0,1,'Prepare yourself!',12,7,100,0,0,0,'Argent Champion', 33755),
(@Exo_Champion,0,2,'On your guard!',12,7,100,0,0,0,'Argent Champion', 33756),
(@Exo_Champion,0,3,'Let it begin!',12,7,100,0,0,0,'Argent Champion', 33758),
(@Exo_Champion,1,0,'Victory is mine!',12,7,100,0,0,0,'Argent Champion', 33777),
(@Exo_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,7,100,0,0,0,'Argent Champion', 33764),
(@Exo_Champion,1,2,'I have won. Better luck another time, friend.',12,7,100,0,0,0,'Argent Champion', 33779),
(@Exo_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,7,100,0,0,0,'Argent Champion', 33778),
(@Exo_Champion,2,0,'I yield to you.',12,7,100,0,0,0,'Argent Champion', 33774),
(@Exo_Champion,2,1,'That was a well fought battle. I yield to you.',12,7,100,0,0,0,'Argent Champion', 33776),
(@Exo_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,7,100,0,0,0,'Argent Champion', 33775),
(@Exo_Champion,2,3,'I have been defeated. Good fight!',12,7,100,0,0,0,'Argent Champion', 33760);
SET @UC_Champion := 33749;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@UC_Champion;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@UC_Champion;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@UC_Champion,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'UC Champion - On Reset - Remove auras from Defend'),
(@UC_Champion,0,1,2,62,0,100,0,10462,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'UC Champion - On gossip select - Close gossip'),
(@UC_Champion,0,2,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0,'UC Champion - Linked with previous event - Call timed actionlist'),
(@UC_Champion,0,3,0,52,0,100,0,0,@UC_Champion,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,'UC Champion - On text over - Cast Charge'),
(@UC_Champion,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,'UC Champion - IC - Cast Thrust'),
(@UC_Champion,0,5,0,9,0,100,0,5,5,9000,10000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'UC Champion - On more than 5 yard range - Cast Shield-Breaker'),
(@UC_Champion,0,6,0,0,0,100,0,9000,11000,9000,10000,46,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'UC Champion - IC - Move forward 12 yards'),
(@UC_Champion,0,7,8,9,0,100,0,9,15,3000,3000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,'UC Champion - On 10-12 yard range - Cast Charge'),
(@UC_Champion,0,8,0,61,0,100,0,0,0,0,0,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,'UC Champion - Linked with previous event - Cast Shield-Breaker'),
(@UC_Champion,0,9,10,2,0,100,1,1,6,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'UC Champion - On HP% between 1% and 6% - Change faction to 35'),
(@UC_Champion,0,10,11,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'UC Champion - Linked with previous event - Say text'),
(@UC_Champion,0,11,12,61,0,100,0,0,0,0,0,85,63596,0,0,0,0,0,7,0,0,0,0,0,0,0,'UC Champion - Linked with previous event - Cast Mounted Melee Victory /item/'),
(@UC_Champion,0,12,0,61,0,100,0,0,0,0,0,85,64816,0,0,0,0,0,1,0,0,0,0,0,0,0,'UC Champion - Linked with previous event - Cast credit'),
(@UC_Champion,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'UC Champion - On player killed - Say text'),
(@UC_Champion,0,14,15,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'UC Champion - Linked with previous event - Set unseen'),
(@UC_Champion,0,15,0,61,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'UC Champion - Linked with previous event - Despawn in 1 ms');
-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @UC_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@UC_Champion,0,0,'Ready yourself!',12,1,100,0,0,0,'Argent Champion', 33757),
(@UC_Champion,0,1,'Prepare yourself!',12,1,100,0,0,0,'Argent Champion', 33755),
(@UC_Champion,0,2,'On your guard!',12,1,100,0,0,0,'Argent Champion', 33756),
(@UC_Champion,0,3,'Let it begin!',12,1,100,0,0,0,'Argent Champion', 33758),
(@UC_Champion,1,0,'Victory is mine!',12,1,100,0,0,0,'Argent Champion', 33777),
(@UC_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,1,100,0,0,0,'Argent Champion', 33764),
(@UC_Champion,1,2,'I have won. Better luck another time, friend.',12,1,100,0,0,0,'Argent Champion', 33779),
(@UC_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,1,100,0,0,0,'Argent Champion', 33778),
(@UC_Champion,2,0,'I yield to you.',12,1,100,0,0,0,'Argent Champion', 33774),
(@UC_Champion,2,1,'That was a well fought battle. I yield to you.',12,1,100,0,0,0,'Argent Champion', 33776),
(@UC_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,1,100,0,0,0,'Argent Champion', 33775),
(@UC_Champion,2,3,'I have been defeated. Good fight!',12,1,100,0,0,0,'Argent Champion', 33760);