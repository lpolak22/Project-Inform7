"Projekt iz kolegija Deklarativno programiranje" by Lucija Polak

Use scoring.
The maximum score is 100.

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
	decrease the score by 5;
	
Room Exit Scene ends when the player is in Forest.

Knock count is a number that varies. Knock count is 0.
Knock number is a number that varies.

Understand "knock [any door]" or "knock on [any door]" as knocking it.

Knocking it is an action applying to one thing.

The player is a person.

Character-chosen is a truth state that varies.
Character-chosen is false.

When play begins:
	 now the score is 30;
	now the player is in the Starting Room;
	say "Welcome to the game! It was created as a project for the Declarative Programming course. However, I hope you will still enjoy playing it.[paragraph break] ";
	say "Choose your character:[line break]";
	say "1 - Ivan (has a torch and one gold coin)[line break]";
	say "2 - Petar (has nothing)[paragraph break]";
	say "Type 1 or 2 to continue.";

Choosing is an action applying to one number.
Understand "[number]" as choosing.

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
			
