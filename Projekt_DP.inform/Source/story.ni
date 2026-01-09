"Projekt iz kolegija Deklarativno programiranje" by Lucija Polak

Include Rideable Vehicles by Graham Nelson.

Use scoring.
The maximum score is 100.

Food-score is a number that varies.
Max-food-score is a number that varies.

Status-checking is an action applying to nothing.
Understand "status" or "stats" as status-checking.

Pet-relationship is a number that varies.
Max-pet-relationship is a number that varies.
Pet-named is a truth state that varies. Pet-named is false.
Special-scene is a truth state that varies. Special-scene is false.

Carry out status-checking:
	say "Score: [score]/[maximum score]. Food: [Food-score]/[Max-food-score]. Pet: [Pet-relationship]/[Max-pet-relationship]. Time: [time of day].";


To apply fall damage:
	decrease the score by 10;
	if the score < 0:
		now the score is 0;
	if the score is 0:
		end the story saying "You succumb to your injuries. Pro tip: take care of yourself";

The Starting Room is a room. "Your adventure begins here."

Ivan is a man in the Starting Room.
Petar is a man in the Starting Room.

Hidden chamber is a room.
The description of Hidden chamber is "[if Pit-Vision-Active  is true]Soft light filters in. You feel powerful, watching the pit from afar. Your laughter echoes.[otherwise]A mysterious hidden space.[end if]".

Lala is a woman in the Hidden chamber. 

The printed name of Lala is "Lala".
The description of Lala is "You sense her presence, even though she is nowhere nearby."
Original-Player is a person that varies.

A thing can be trap-triggering.

The box is trap-triggering.
The golden stool is trap-triggering.
The golden apple is trap-triggering.

The Trap Zone is a region.
LightRoom is in the Trap Zone.
DarkChamber is in the Trap Zone.

A torch is a unlit thing. 
Every turn when the torch is lit and the location is DarkChamber:
	now DarkChamber is lighted.
	
A gold coin is a thing.

The torch is carried by Ivan.
The gold coin is carried by Petar.

Trap revealed is a truth state that varies. Trap revealed is false.
Trap timer is a number that varies. Trap timer is 0.
Pit Room is a room. "You fell into a dark pit. A trap door closed above you."
The trap door is a locked door. The trap door is north of Pit Room and south of DarkChamber. The trap door is locked. It is scenery. Understand "hole" as the trap door when Trap revealed is true.

Pit-Vision-Active is a truth state that varies. Pit-Vision-Active is false.

Instead of listening in Pit Room:
	say "Somewhere above you, you hear slow footsteps. Someone is walking. Unhurried.";

Instead of smelling in Pit Room:
	say "The air smells of damp stone, dust, and something faintly metallic.";

Instead of touching in Pit Room:
	say "Cold stone presses against your fingers, rough and scarred.";

Instead of tasting in Pit Room:
	say "Your mouth is dry. The metallic taste of blood still lingers.";

Instead of examining the trap door when the player is in Pit Room:
	say "A heavy metal door. Locked. On the other side, you hear movement.";

The box empty is a truth state that varies. The box empty is true.

The NorthDoor is a door.
NorthDoor is south of Forest and north of LightRoom.
NorthDoor is locked. 
The description is "A newly appeared frozen door."
NorthDoor is scenery.

ForestDoor is a door.
ForestDoor is west of DarkChamber and east of Forest. 
ForestDoor is locked.
The description is "A newly appeared wooden door."

Forest is a room. "You are in a dense forest. You hear a waterfall nearby and voices talking in the distance."

First-time-forest-question is a truth state that varies. First-time-forest-question is true.

Room Exit Scene is a scene.  
Room Exit Scene begins when the player is in Forest for the first time.

When Room Exit Scene begins:
	if First-time-forest-question is true:
		now First-time-forest-question is false;
		say "[italic type]Where exactly am I?[roman type][line break]";

When Room Exit Scene ends:
	now ForestDoor is closed;
	now NorthDoor is closed;
	now ForestDoor is locked;
	now NorthDoor is locked;
	say "You hear a soft click behind you.";
	say "You seem to be hungry, find something to eat.";
	decrease the Food-score by 5;
	say "Food: [Food-score]/[Max-food-score].";
	
Room Exit Scene ends when the player is in Forest.

Knock count is a number that varies. Knock count is 0.
Knock number is a number that varies.

Understand "knock [any door]" or "knock on [any door]" as knocking it.

Knocking it is an action applying to one thing.

The player is a person.

Character-chosen is a truth state that varies.
Character-chosen is false.

When play begins:
	now score is 30;
	now Food-score is 10;
	now Max-food-score is 10;
	now Pet-relationship is 0;
	now Max-pet-relationship is 10;
	now the player is in the Starting Room;
	say "Welcome to the game! It was created as a project for the Declarative Programming course. However, I hope you will still enjoy playing it.[paragraph break] ";
	say "Choose your character:[line break]";
	say "1 - Ivan (has a torch and one gold coin)[line break]";
	say "2 - Petar (has nothing)[paragraph break]";
	say "Type 1 or 2 to continue.";

Choosing is an action applying to one number.
Understand "[number]" as choosing.

Every turn when Character-chosen is true:
	if the minutes part of the time of day is 0:
		decrease Food-score by 1;
	if Food-score <= 0:
		now Food-score is 0;
		end the story saying "You have starved to death. Next time, eat more";

[Use undo prevention.]

Carry out choosing:
	if Character-chosen is true:
		say "You have already chosen your character.";
	otherwise if the number understood is 1:
		now the player is Ivan;
		now Character-chosen is true;
		now Petar is off-stage;
		move the player to DarkChamber;
		say "You have chosen Ivan. Good luck on your adventure!";
	otherwise if the number understood is 2:
		now the player is Petar;
		now Character-chosen is true;
		now Ivan is off-stage;
		move the player to LightRoom;
		say "You have chosen Petar. Good luck on your adventure!";
	otherwise:
		say "Invalid choice. Type 1 or 2.";

Instead of doing something other than choosing when Character-chosen is false:
	say "You must choose a character first. Type 1 or 2.";

When play ends:
	if Pet-named is true:
		now Special-scene is true;
	otherwise:
		now Special-scene is false;

Chapter 1 - Where am I?

DarkChamber is a dark room. The printed name is "The Dark Room".
The description is "[if DarkChamber is lighted]The room is now illuminated by your torch. On a small golden stool sits a golden apple.[otherwise]The room is dark. You can barely make out a small golden stool in the faint light.[end if]".

LightRoom is a room. The printed name of LightRoom is "The Light Room".
"The room is well-lit and empty except for an old wooden box on the floor."

Golden stool is a scenery supporter in DarkChamber. Understand "small golden" as Golden stool. "A small stool made of solid gold."
Golden apple is a scenery thing on the Golden stool."The golden apple has 'RUN' inscribed on it!"

Box is an open container in LightRoom. "An old, run-down wooden box sits on the floor."
The block burning rule does nothing when the noun is not the torch.

Before going somewhere when in darkness:
	say "It's too dark, light the torch first!" instead.
	
Check burning the torch:
	if the torch is lit, say "The torch is already lit." instead;
	now the torch is lit;
	say "You light the torch. The room is now illuminated." instead.

Check burning something:
	say "You can't light that." instead.

Extinguishing it is an action applying to one thing. Understand "extinguish [something]" as extinguishing it.

Carry out extinguishing it:
	if the noun is not a torch:
		say "You can't extinguish that.";
	otherwise if the torch is unlit:
		say "The torch is already unlit.";
	otherwise:
		now the torch is unlit;
		now the location is dark;
		say "You extinguish the torch. Darkness surrounds you again.";

After examining the golden apple:
	if Trap revealed is false:
		say "It seems light for something made of gold.";
		now Trap timer is 3;
		now Trap revealed is true;
		say "[italic type]Don't do it... In 3..[roman type]";		

Before taking the golden apple when Trap revealed is true:
	say "[italic type]Ignoring the warning...[roman type]".

Instead of taking a trap-triggering thing when the location is in the Trap Zone:
	say "As you touch it, the floor beneath you collapses!";
	apply fall damage;
	now Original-Player is the player;
	if the noun is the golden apple:
		say "The apple crumbles to dust!";
		now Trap timer is 0;
	now the noun is off-stage;
	move the player to Pit Room;
	now the time of day is 11:55 AM;
	if the player carries the torch:
		try silently dropping the torch;
		now the torch is off-stage;
	if the player carries the coin:
		try silently dropping the coin;
		now the coin is off-stage;
	now the trap door is locked.

Every turn when Trap timer > 0:
	decrease Trap timer by 1;
	if Trap timer is 2:
		say "The floor creaks ominously...";
	otherwise if Trap timer is 1:
		say "The floor collapses! You fall through a hole!";
		apply fall damage;
		now Original-Player is the player;
		move the player to Pit Room;
		now the time of day is 11:55 AM;
		if the player carries the torch:
			try silently dropping the torch;
			now the torch is off-stage;
		now the trap door is locked.

Every turn when the player is in Pit Room and the time of day is 12:00 PM and Pit-Vision-Active is false:
	now Pit-Vision-Active is true;
	now Original-Player is the player;
	say "[bold type]*** LALA VISION ***[roman type][paragraph break]You see through Lala's eyes in her hidden chamber... She giggles and gestures toward a door above the pit.";

Lala-response is a text that varies.

Before doing something when Pit-Vision-Active is true and the current action is not Helping:
	let R be a random number from 1 to 3;
	if R is 1:
		say "Lala giggles: 'Maybe you should ask for help.'";
	else if R is 2:
		say "Lala whispers: 'It's no use...'";
	else:
		say "Lala laughs: 'Be polite!'";
	stop the action.

Helping is an action applying to nothing. Understand "help" as helping.

Carry out Helping:
	if Pit-Vision-Active is true:
		now Pit-Vision-Active is false;
		say "What's happening? Am I disappearing?[line break]";
		say "You hear [italic type]voice through the wind: Knock on the door!";
		say "[bold type]You escaped Lala for now. Find a way out.[paragraph break]";
		if Original-Player is Petar:
			move Original-Player to LightRoom;
		otherwise:
			move Original-Player to DarkChamber;
	otherwise:
		say "Help? Try exploring.".

Carry out knocking it:
	increase knock count by 1;
	if the noun is a door:
		if the noun is locked:
			if knock count is 1:
				let N be a random number from 2 to 5;
				now knock number is N;
				say "[italic type]Voice through the wind: Knock [knock number] times![roman type][line break]";
			otherwise if knock count is knock number:
				say "[italic type]CLICK! The door unlocks![roman type][line break]";
				say "Huh, did I count right?";
				now the noun is unlocked;
				now the noun is open;
				now knock count is 0;
			otherwise if knock count < knock number:
				say "Knocked [knock count] of [knock number] times.[line break]";
		otherwise:
			say "The door is already unlocked.[line break]";
	else:
		say "Nothing happens when you knock on that.";

Instead of opening the ForestDoor when the ForestDoor is locked:
	say "It's locked.".
	
After inserting something into the box:
	if the noun is the gold coin:
		if the box empty is true:
			now the box empty is false;
			now the NorthDoor is unlocked;
			now the NorthDoor is open;
			say "You put the gold coin in the box. A door opens on the north!";
		otherwise:
			say "The box already contains the gold coin.";
			
Chapter 2 - A new friend

The FlowerValley is a room. "A vibrant valley bursting with colorful wildflowers stretches before you in every direction. Petals of red, yellow, and purple sway gently in the breeze, filling the air with sweet scents. Amid the blooms, a small furry creature with big curious eyes peeks from behind a daisy cluster—the little animal has found its perfect home here, waiting eagerly for playtime."
FlowerValley is west of Forest.

Hints-unlocked is a truth state that varies. Hints-unlocked is false.

The giant duck is a rideable animal.
The giant duck is in Hidden Room.
The description of the giant duck is "A ridiculously large duck with gentle eyes. It looks like it might let you ride it."
Understand "pet" or "duck" or "animal" as the giant duck.

A berry is a kind of thing. The description is "A small juicy fruit hanging from a bush."
A berry can be ripe or unripe. A berry is usually ripe.
A berry is edible.

The BerryBush is a supporter in Forest. "A bush heavy with small berries. Some look ripe, some unripe."
Understand "bush" or "berry bush" as the BerryBush.

A bush-container is a container. It is part of the BerryBush. It is open and enterable.

There are 75 berries.

When play begins:
	repeat with B running through berries:
		move B to the bush-container;
		now B is ripe;
		if a random chance of 1 in 3 succeeds:
			now B is unripe;

Understand "eat [something]" as eating.

Check eating:
	if the noun is not a berry:
		say "You can't eat that." instead;
	if Food-score >= Max-food-score:
		say "You are already full and cannot eat any more berries." instead.

Carry out eating:
	if the noun is ripe:
		increase Food-score by 2;
		say "You eat the ripe berry. You feel fuller (+2 food).";
	otherwise:
		decrease Food-score by 1;
		if Food-score < 0:
			now Food-score is 0;
		say "You eat an unripe berry. Yuck! (-1 food).";
	now the noun is off-stage;

After looking in FlowerValley for the first time:
	if the giant duck is off-stage:
		move the giant duck to FlowerValley;
	say "A giant duck waddles up to you and tilts its head, as if waiting for a name.";
	say "You can type: name duck as <name>.";
	say "Tip: you can increase the relationship with your pet.";
	now Hints-unlocked is true;

To increase pet bond by (N - a number):
	now Pet-relationship is Pet-relationship + N;
	if Pet-relationship > Max-pet-relationship:
		now Pet-relationship is Max-pet-relationship;

Naming it as is an action applying to one thing and one topic.
Understand "name [something] as [text]" as naming it as.

Check naming it as:
	if the noun is not the giant duck:
		say "That doesn't seem like something you can name." instead;
	if Pet-named is true:
		say "You already named your pet." instead.

Carry out naming it as:
	now Pet-named is true;
	now the printed name of the giant duck is the topic understood;
	say "You name the duck '[printed name of the giant duck]'. It seems happy.";
	now the giant duck is proper-named;
	if Pet-relationship < Max-pet-relationship:
		increase pet bond by 2;
	
Instead of giving a berry to the giant duck:
	if Pet-relationship >= Max-pet-relationship:
		say "[The giant duck] turns away—it's already as attached to you as possible.";
	otherwise:
		remove the noun from play;
		increase pet bond by 1;
		say "[The giant duck] happily eats the berry. (Pet +1)";

Understand "feed [someone] with [something]" as giving it to (with nouns reversed).

Petting is an action applying to one thing.
Understand "pet [something]" or "pat [something]" or "stroke [something]" as petting.

Check petting:
	if the noun is not the giant duck:
		say "That doesn't seem to want petting." instead;
	if Pet-relationship >= Max-pet-relationship:
		say "[The giant duck] seems perfectly bonded with you already." instead.

Carry out petting:
	increase pet bond by 1.

Report petting:
	say "You gently pet [the giant duck]. It seems calmer. (Pet +1)";

Every turn:
	if Pet-relationship > Max-pet-relationship:
		now Pet-relationship is Max-pet-relationship;

Table of Wind Hints
needed room	min relationship	requires named?	hint text	shown
FlowerValley	0	true	"[italic type]Voice through the wind:[roman type] 'Try PET DUCK to bond.'"	false
FlowerValley	2	true	"[italic type]Voice through the wind:[roman type] 'Feed it: GIVE BERRY TO DUCK.'"	false
FlowerValley	4	true	"[italic type]Voice through the wind:[roman type] 'Travel together: RIDE DUCK / (DIS)MOUNT DUCK.'"	false

To say a new wind hint:
	let found be false;
	repeat through the Table of Wind Hints:
		if found is false:
			if shown entry is false:
				if the player is in the needed room entry:
					if Pet-relationship >= min relationship entry:
						if requires named? entry is false and Pet-named is false:
							say hint text entry;
							now shown entry is true;
							now found is true;
						otherwise if requires named? entry is true and Pet-named is true:
							say hint text entry;
							now shown entry is true;
							now found is true;

Every turn when the player is in FlowerValley:
	say a new wind hint;
