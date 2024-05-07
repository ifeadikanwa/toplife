import 'package:intl/intl.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';

class ConversationGenerator {
  //*convo
  static String getRandomFirstPersonConversation({
    required Person person,
    required String relationshipLabel,
  }) {
    //70/30 chance regular chat or debate

    return (Chance.getTrueOrFalseBasedOnPercentageChance(
            trueChancePercentage: 70))
        ? getRandomFirstPersonRegularChat(
            person: person,
            relationshipLabel: relationshipLabel,
          )
        : getRandomFirstPersonDebate(
            person: person,
            relationshipLabel: relationshipLabel,
          );
  }

  //*uninterested response
  static SentencePair getRandomPersonUninterestedResponse({
    required Person person,
    required String relationshipLabel,
  }) {
    //get response
    final String chosenResponse = getRandomValueFromSet(
      set: uninterestedResponses,
    );

    //return sentence pair because we don't want the chosen response to be run through a sentence util converter.
    final String firstPersonResponse =
        "I tried to talk to my $relationshipLabel, ${person.firstName}, and ${person.subjectPronoun} said '$chosenResponse'";
    final String secondPersonResponse =
        "You tried to talk to your $relationshipLabel, ${person.firstName}, and ${person.subjectPronoun} said \"$chosenResponse\"";

    return SentencePair(
      firstPersonSentence: firstPersonResponse,
      secondPersonSentence: secondPersonResponse,
    );
  }

  //*intro helper for consistency
  static String getFirstPersonConvoIntroductionString({
    required String firstName,
    required String chosenDescription,
    required String chosenTopic,
    required String relationshipLabel,
  }) {
    //return string
    return "I $chosenDescription with my $relationshipLabel, $firstName about $chosenTopic.";
  }

  //*Regular chat
  static String getRandomFirstPersonRegularChat({
    required Person person,
    required String relationshipLabel,
  }) {
    //get chat topic
    //80/20 chance it is regular or moment
    final String chosenTopic =
        (Chance.getTrueOrFalseBasedOnPercentageChance(trueChancePercentage: 80))
            ? getRandomValueFromSet(set: regularChatTopics)
            : getRandomValueFromSet(
                set: momentsRegularChatTopics(
                  subjectPronoun: person.subjectPronoun,
                  possessivePronoun: person.possessivePronoun,
                ),
              );

    //get chat description
    final String chosenChatDescription =
        getRandomValueFromSet(set: regularChatDescriptions);

    //return chat
    return getFirstPersonConvoIntroductionString(
      firstName: person.firstName,
      chosenDescription: chosenChatDescription,
      chosenTopic: chosenTopic,
      relationshipLabel: relationshipLabel,
    );
  }

  //*Debate
  //MAIN
  static String getRandomFirstPersonDebate({
    required Person person,
    required String relationshipLabel,
  }) {
    //50/50 chance return statement or versus
    return (Chance.getTrueOrFalse())
        ? getRandomFirstPersonDebateStatement(
            person: person,
            relationshipLabel: relationshipLabel,
          )
        : getRandomFirstPersonVersusDebate(
            person: person,
            relationshipLabel: relationshipLabel,
          );
  }

  //HELPERS:

  //STATEMENT DEBATE
  static String getRandomFirstPersonDebateStatement({
    required Person person,
    required String relationshipLabel,
  }) {
    //get all the needed sentences
    //statement
    final String chosenTopic = getRandomValueFromSet(
      set: debateStatementTopics,
    );
    //description
    final String chosenDebateDescription =
        getRandomValueFromSet(set: debateDescriptions);

    //build sentence
    final StringBuffer debateStringBuffer = StringBuffer();

    //introduction
    debateStringBuffer.write(
      getFirstPersonConvoIntroductionString(
        firstName: person.firstName,
        chosenDescription: chosenDebateDescription,
        chosenTopic: chosenTopic,
        relationshipLabel: relationshipLabel,
      ),
    );

    //conclusion
    //if the statement does NOT have "or", we can give a yes or no response
    if (!chosenTopic.toLowerCase().contains(or)) {
      //choose a random yes or  no response
      final String chosenResponse = getRandomValueFromSet(set: yesAndNoWords);
      debateStringBuffer.write(
        "\n${toBeginningOfSentenceCase("${person.subjectPronoun} said $chosenResponse.")}",
      );
    }

    //return string
    return debateStringBuffer.toString();
  }

  //VERSUS DEBATE
  static String getRandomFirstPersonVersusDebate({
    required Person person,
    required String relationshipLabel,
  }) {
    //get all the needed sentences:
    //get a random debate topic
    //split the sentence into two
    //get a random debate description

    final String chosenTopic = getRandomValueFromSet(set: versusTopics);
    final List<String> debatePoints = chosenTopic.split(versusDividerWord);
    final String chosenDebateDescription =
        getRandomValueFromSet(set: debateDescriptions);

    final StringBuffer debateStringBuffer = StringBuffer();

    //build the sentence:
    //add the intro sentence
    debateStringBuffer.write(
      getFirstPersonConvoIntroductionString(
        firstName: person.firstName,
        chosenDescription: chosenDebateDescription,
        chosenTopic: chosenTopic,
        relationshipLabel: relationshipLabel,
      ),
    );

    //if the debate points are two, build the conclusions
    if (debatePoints.length == 2) {
      //get words
      final String chosenSide = getRandomValueFromList(
        list: debatePoints,
      );
      final String chosenAdjective = getRandomValueFromSet(
        set: positiveAndNegativeDescriptionAdjectives,
      );
      //build sentence
      debateStringBuffer.write(
        "\n${toBeginningOfSentenceCase("${person.subjectPronoun} said $chosenSide is $chosenAdjective.")}",
      );
    }

    //return result
    return debateStringBuffer.toString();
  }

  //
  //
  //*STRINGS

  static const Set<String> regularChatDescriptions = {
    "had a chat",
    "had a talk",
    "had a convo",
    "had a heart-to-heart",
    "had a good ol' chat",
    "had a chitchat",
    "had a catch-up",
    "had a powwow",
  };

  static const Set<String> debateDescriptions = {
    "had a heated argument",
    "had a friendly showdown",
    "had a verbal sparring match",
    "had a lively debate",
    "had a back-and-forth exchange",
    "had a spirited disagreement",
    "had a clash of opinions",
    "had a battle of wits",
    "had a verbal duel",
    "had a feisty debate",
  };

  static const Set<String> positiveAndNegativeDescriptionAdjectives = {
    "dull",
    "gross",
    "nasty",
    "ugly",
    "tacky",
    "cringe-worthy",
    "trashy",
    "abysmal",
    "mediocre",
    "crappy",
    "awful",
    "terrible",
    "horrible",
    "pathetic",
    "miserable",
    "useless",
    "awesome",
    "fantastic",
    "amazing",
    "cool",
    "rad",
    "epic",
    "stellar",
    "fabulous",
    "superb",
    "outstanding",
    "terrific",
    "incredible",
    "phenomenal",
    "impressive",
    "mind-blowing",
    "dope",
  };

  static const Set<String> yesAndNoWords = {
    //positive
    "nah",
    "definitely",
    "nope",
    "without a doubt",
    "of course",
    "of course not",
    "certainly",
    "certainly not",
    "absolutely",
    "absolutely not",
    "yup",
    "no",
  };

  //uninterested
  static const Set<String> uninterestedResponses = {
    "Take a hike!",
    "Beat it!",
    "Get lost!",
    "Leave me be!",
    "Take off!",
    "Go bother someone else!",
    "Buzz off!",
    "Scram!",
    "Give me some space!",
    "I need some alone time, so back off!",
    "Quit pestering me!",
    "Can you please just leave me alone?",
    "I'm not interested, so go away.",
    "I've had enough, so bugger off!",
    "Please take the hint and go away.",
    "Stop bothering me!",
    "I'd appreciate it if you left me alone.",
    "Do us both a favor and go.",
    "I'm really not in the mood for company, so scram.",
    "Leave me alone, will you?",
    "Enough already, leave me in peace.",
    "Back off and give me some breathing room.",
    "I'm not interested, so take a hike.",
    "Please take the hint and go bother someone else.",
    "Go find someone else to annoy.",
    "I'm not up for conversation, so kindly go away.",
    "Do me a favor and leave me be.",
    "Can you give me some space, please?",
    "I'm on my own time, so bugger off.",
    "I'd appreciate it if you left me alone now.",
    "I need some solitude, so please respect that.",
    "I'm not feeling sociable right now, so move along.",
    "Go bother someone who actually wants your attention.",
    "I'm sorry, but I don't want to chat, so go.",
    "Find another target, because I'm not interested.",
    "Go find another person to annoy, please.",
    "Leave me to my own devices and go away.",
    "I'm not open to conversation, so skedaddle.",
    "I need some quiet time, so go bother someone else.",
    "I'm not in the mood to talk, so kindly disappear.",
    "I don't need your company, so take a hike.",
    "I'm trying to be alone here, so please respect that.",
    "I'm not available for chit-chat, so go find someone else.",
    "I'm not feeling like socializing, so leave me alone.",
    "I don't want to be bothered, so go find another person.",
    "Please leave me in peace and go away.",
    "I'm not interested in what you have to say, so move on.",
    "I'm really not up for company, so go find someone else to bother.",
    "Leave me alone, will you? I've had enough.",
  };

  //Debate statement response decider
  static const or = " or ";

  //DEBATE STATEMENTS
  static Set<String> debateStatementTopics = {
    //fun
    "whether a hot dog is a sandwich or not",
    "whether socks should always be worn inside out",
    "whether ketchup belongs on a hot dog",
    "whether the toilet paper roll should hang over or under",
    "whether pineapple belongs on pizza",
    "whether cats secretly control the world",
    "whether a tomato is a fruit or a vegetable",
    "whether 'supercalifragilisticexpialidocious' is a real word",
    "whether aliens are more afraid of us than we are of them",
    "whether it's acceptable to wear socks with sandals",
    "whether you should put milk or cereal first when making breakfast",
    "whether time travel is possible",
    "whether it's better to be a vampire or a werewolf",
    "whether the chicken or the egg came first",
    "whether it's better to be a superhero or a supervillain",
    "whether it's appropriate to use emojis in formal emails",
    "whether zombies would make good neighbors",
    "whether toothpaste should be squeezed from the middle or the end",
    "whether it's better to have eyes in the back of your head or extra arms",
    "whether a piece of cake is an appropriate breakfast choice",
    "whether unicorns are real",
    "whether socks have feelings",
    "whether it's better to be a pirate or a ninja",
    "whether it's acceptable to talk to plants",
    "whether laughter is the best medicine",
    "whether it's better to have a flying car or a teleportation device",
    "whether it's acceptable to wear pajamas in public",
    "whether clowns are funny or terrifying",
    "whether it's better to have a lifetime supply of pizza or ice cream",
    "whether it's better to be invisible or have the ability to read minds",
    "whether it's appropriate to wear a superhero cape to work",
    "whether it's better to live in a treehouse or a submarine",
    "whether it's acceptable to eat dessert before the main course",
    "whether it's better to have super strength or the ability to fly",
    "whether it's appropriate to bring a pet dinosaur to school",
    "whether it's better to have a personal robot assistant or a personal chef",
    "whether it's acceptable to eat pizza with a fork and knife",
    "whether it's better to be a professional video gamer or a professional cuddler",
    "whether it's appropriate to wear a onesie to a job interview",
    //serious
    "whether the death penalty should be abolished",
    "whether gun control laws should be more strict",
    "whether animal testing should be banned",
    "whether capital punishment is an effective deterrent for crime",
    "whether marijuana should be legalized",
    "whether social media has a positive or negative impact on society",
    "whether the government should provide free healthcare",
    "whether standardized testing accurately measures student performance",
    "whether climate change is primarily caused by human activities",
    "whether nuclear energy is a viable solution for a sustainable future",
    "whether the voting age should be lowered or raised",
    "whether affirmative action policies are necessary to promote equality",
    "whether schools should enforce mandatory school uniforms",
    "whether the minimum wage should be increased",
    "whether censorship is justified in certain circumstances",
    "whether college education should be free for all students",
    "whether the use of surveillance cameras infringes on privacy rights",
    "whether euthanasia should be legalized",
    "whether the age of consent should be changed",
    "whether genetically modified foods should be labeled",
    "whether homeschooling is better than traditional schooling",
    "whether space exploration is worth the cost",
    "whether the internet has made people more or less connected",
    "whether the government should regulate the use of artificial intelligence",
    "whether vaccines should be mandatory",
    "whether the use of drones for surveillance is ethical",
    "whether the age for driving should be raised",
    "whether parents should be held legally responsible for their children's actions",
    "whether the use of torture is ever justified",
    "whether public schools should teach sex education",
    "whether the use of renewable energy sources should be prioritized",
    "whether privacy rights should be sacrificed for national security",
    "whether assisted suicide should be legalized",
    "whether school curriculum should include religious education",
    "whether affirmative action promotes or hinders equality",
    "whether the government should regulate the sale of firearms",
    "whether nuclear weapons should be completely eliminated",
    "whether genetic engineering of humans should be allowed",
    "whether the drinking age should be lowered or raised",
    "whether social media platforms should be responsible for monitoring and removing fake news",
  };

  //FOR VERSUS TOPICS
  static const String versusDividerWord = " vs. ";

  //NO PLURALS
  static const Set<String> versusTopics = {
    //scary
    "ghost vs. demon",
    "zombie vs. vampire",
    "serial killer vs. supernatural monster",
    "haunted house vs. abandoned asylum",
    "psychological horror vs. gore and violence",
    "alien vs. monster",
    "possession vs. curse",
    "dark magic vs. mysterious cult",
    "slasher film vs. psychological thriller",
    "urban legend vs. folklore creature",
    "paranormal activity vs. found footage",
    "sleep paralysis vs. nightmare",
    "devil vs. the unknown",
    "clown vs. doll",
    "supernatural power vs. mind control",
    "uncanny valley vs. body horror",
    "silent horror film vs. modern jump scare",
    "witch vs. werewolf",
    "possessed object vs. haunted doll",
    "isolation vs. darkness",

    //deep
    "love vs. duty",
    "fate vs. free will",
    "betrayal vs. sacrifice",
    "ambition vs. morality",
    "revenge vs. forgiveness",
    "desperation vs. hope",
    "pride vs. humility",
    "loss vs. regret",
    "ignorance vs. knowledge",
    "innocence vs. corruption",
    "isolation vs. connection",
    "war vs. peace",
    "loyalty vs. betrayal",
    "power vs. powerlessness",
    "illusion vs. reality",
    "broken dreams vs. lost opportunities",
    "pride vs. regret",
    "hope vs. despair",
    "innocence vs. guilt",
    "sacrifice vs. selfishness",
    "truth vs. secrecy",
    "family vs. duty",
    "trust vs. betrayal",
    "redemption vs. damnation",
    "youth vs. aging",
    "legacy vs. oblivion",
    "innocence vs. experience",
    "hope vs. desperation",
    "idealism vs. realism",
    "love vs. loss",
    "nature vs. nurture",
    "education vs. experience",
    "pursuing passion vs. financial stability",
    "traveling vs. settling down",
    "traditional careers vs. entrepreneurship",
    "marriage vs. single life",
    "living in the present vs. planning for the future",
    "risk-taking vs. security",
    "emotional intelligence vs. intellectual intelligence",
    "personal growth vs. external validation",
    "material wealth vs. emotional well-being",
    "conformity vs. individuality",
    "work-life balance vs. dedication to career",
    "traditional gender roles vs. gender equality",
    "self-reflection vs. seeking advice",
    "forgiveness vs. holding grudges",
    "mindfulness vs. multitasking",
    "taking initiative vs. waiting for opportunities",
    "healthy lifestyle vs. indulgence",
    "personal values vs. societal expectations",
    "self-love vs. self-improvement",
    "traditional family vs. chosen family",
    "social media vs. face-to-face interactions",
    "empathy vs. self-interest",
    "embracing change vs. resisting change",
    "pursuing dreams vs. meeting expectations",
    "gratitude vs. ambition",
    "environmental responsibility vs. convenience",
    "collaboration vs. competition",
    "empowerment vs. dependence",
    "personal boundaries vs. accommodating others",
    "financial independence vs. financial support",
    "authenticity vs. social adaptation",
    "mental health vs. achievement",
    "lifelong learning vs. specialization",
    "philanthropy vs. personal success",
    "resilience vs. avoidance",
    "spirituality vs. atheism",
    "self-discovery vs. external influence",
    "artificial intelligence vs. human intelligence",
    "space exploration vs. ocean exploration",
    "privacy vs. national security",
    "genetic engineering vs. natural evolution",
    "renewable energy vs. fossil fuels",
    "virtual reality vs. real-life experiences",
    "globalization vs. localization",
    "universal basic income vs. traditional employment",
    "online education vs. traditional classroom education",
    "artificial meat vs. traditional meat",
    "mars colonization vs. earth preservation",
    "automation vs. job creation",
    "virtual currency vs. traditional currency",
    "universal healthcare vs. private healthcare",
    "internet freedom vs. internet regulation",
    "cloning vs. bioethics",
    "animal testing vs. animal rights",
    "cryptocurrency vs. traditional banking",
    "gene editing vs. ethical boundaries",
    "autonomous vehicle vs. human driver",
    "internet censorship vs. freedom of speech",
    "surveillance society vs. personal privacy",

    //fame
    "fame vs. privacy",
    "talent vs. publicity",
    "celebrity culture vs. substance",
    "overnight success vs. long-term success",
    "authenticity vs. image",
    "personal life vs. professional life",
    "fame vs. talent",
    "social media influence vs. traditional fame",
    "celebrity activism vs. authentic social change",
    "fame vs. fortune",
    "celebrities as role models vs. personal responsibility",
    "fame at a young age vs. fame in adulthood",
    "celebrity endorsements vs. authentic recommendations",
    "celebrity scandal vs. privacy invasion",
    "fame vs. mental health",
    "fame in the arts vs. fame in sports",
    "celebrity influence vs. individual agency",
    "celebrity couple vs. individual achievement",
    "celebrity obsession vs. healthy admiration",
    "traditional media vs. social media fame",
    "celebrity philanthropy vs. genuine social change",
    "celebrity worship vs. critical evaluation",
    "celebrity endorsements vs. personal research",
    "celebrity autobiography vs. unauthorized biography",

    //action
    "practical effect vs. cgi",
    "martial art vs. firearm",
    "superhero movie vs. realistic action movie",
    "fast-paced action vs. slow-burn suspense",
    "stunt vs. special effect",
    "practical weapon vs. futuristic weapon",
    "hand-to-hand combat vs. weapon-based combat",
    "realistic injury vs. over-the-top action",
    "tactical planning vs. impulsive action",
    "practical stunt vs. cgi stunt",
    "solo action hero vs. ensemble action team",
    "practical explosion vs. cgi explosion",
    "realistic fight choreography vs. choreographed spectacle",
    "practical blood and gore vs. cgi blood and gore",
    "practical parkour vs. cgi parkour",
    "real-time action vs. slow-motion action",
    "practical fire effects vs. cgi fire effects",
    "realistic weapon handling vs. stylistic weapon handling",
    "realistic car chases vs. high-octane car stunts",
    "practical water stunt vs. cgi water stunt",
    "one-take action scene vs. edited action sequences",
    "realistic injury recovery vs. quick recovery",
    "practical fight training vs. cinematic fight technique",
    "realistic bullet physics vs. cinematic bullet physics",
    "realistic sound effects vs. enhanced sound design",
    "handheld weapon vs. sci-fi energy weapon",
    "realistic blood splatter vs. exaggerated blood splatter",
    "tactical gear vs. stylistic costume design",
    "realistic explosion effect vs. cinematic explosion effect",
    "practical vehicle stunt vs. cgi vehicle stunt",
    "realistic hand-to-hand combat vs. martial arts fantasy",

    //romance
    "love at first sight vs. love that grows over time",
    "candlelit dinner vs. outdoor picnic",
    "long-distance relationships vs. close-proximity relationships",
    "romance in movies vs. real-life romance",
    "traditional dating vs. online dating",
    "expressing love through words vs. actions",
    "public displays of affection vs. private displays of affection",
    "romantic gestures vs. practical gestures",
    "love letters vs. text messages",
    "passionate love vs. companionate love",
    "monogamy vs. polyamory",
    "celebrating anniversaries vs. everyday acts of love",
    "physical intimacy vs. emotional intimacy",
    "fate vs. choice",
    "arranged marriages vs. love marriages",
    "physical appearance vs. inner beauty",
    "romantic surprises vs. consistent acts of thoughtfulness",
    "compatibility vs. chemistry",
    "love conquers all vs. practical considerations",
    "love vs. career ambition",
    "romantic getaways vs. building a home together",
    "chasing after love vs. allowing love to find you",
    "public proposals vs. private proposals",
    "celebrating valentine's day vs. celebrating love every day",
    "big, extravagant weddings vs. intimate, small weddings",
    "love at a young age vs. love in later stages of life",
    "unconditional love vs. setting boundaries",
    "love languages vs. intuitive understanding",
    "significance of giving gifts vs. quality time spent together",
    "sharing social media passwords vs. trusting your partner's privacy",
    "being best friends with your partner vs. having separate social circles",
    "long-term commitment vs. taking each day as it comes",
    "influence of astrology on romantic compatibility vs. personal compatibility factor",
    "love vs. lust",
    "love poems vs. love songs",
    "sharing a bank account vs. maintaining financial independence",
    "romantic surprises vs. consistency and reliability",
    "traditional gender roles vs. modern egalitarian relationships",
    "unrequited love vs. moving on and finding new love",
    "love at first sight vs. growing love",
    "soulmates vs. compatibility",
    "passionate love vs. committed love",
    "traditional relationships vs. open relationships",
    "long-distance relationships vs. close proximity relationships",
    "fairy tale romance vs. realistic expectations",
    "love vs. friendship",
    "love in the digital age vs. traditional romance",
    "emotional intimacy vs. physical intimacy",
    "love vs. independence",
    "selfless love vs. self-love",
    "love languages vs. compatibility",
    "love vs. infatuation",
    "romantic gestures vs. emotional support",
    "romantic movies vs. real-life romance",
    "spontaneous love vs. planned romance",
    "unrequited love vs. letting go",
    "love vs. career",
    "age-gap relationships vs. same-age relationships",
    "intercultural relationships vs. same-culture relationships",
    "modern dating apps vs. traditional courtship",
    "intimacy vs. personal boundaries",
    "love vs. career aspirations",
    "love vs. timing",
    "love vs. fear of vulnerability",
    "love vs. parental approval",
    "emotional stability vs. passionate love",
    "romantic traditions vs. modern relationship norms",
    "love vs. financial compatibility",
    "love vs. personal growth",
    "love vs. sacrifice",
    "love vs. settling",
    "emotional support vs. practical support",
    "love vs. trust",
    "love vs. compatibility",
    "love vs. chemistry",
    "love vs. social pressure",

    //random
    "cat vs. dog",
    "pizza vs. burgers",
    "summer vs. winter",
    "book vs. movie",
    "coffee vs. tea",
    "marvel vs. dc",
    "beach vacation vs. mountain vacation",
    "pancake vs. waffle",
    "fiction vs. non-fiction",
    "texting vs. calling",
    "comedy vs. horror movies",
    "pop music vs. rock music",
    "summer olympic vs. winter olympic",
    "snapchat vs. instagram",
    "chocolate vs. vanilla",
    "indoor game vs. outdoor game",
    "apple vs. android",
    "morning person vs. night owl",
    "flight vs. invisibility",
    "e-book vs. physical book",
    "video game vs. board game",
    "singing vs. dancing",
    "camping vs. glamping",
    "facebook vs. twitter",
    "comedy vs. drama",
    "hot weather vs. cold weather",
    "star wars vs. star trek",
    "smoothie vs. milkshake",
    "tattoo vs. piercing",
    "comedy roast vs. stand-up comedy",
    "netflix vs. youtube",
    "cake vs. pie",
    "roller coasters vs. water slides",
    "sneaker vs. sandal",
    "comedy movie vs. action movie",
    "summer camp vs. sleepovers",
    "facebook vs. instagram",
    "comedy skit vs. funny meme",
    "fictional character vs. historical figure",
    "fast food vs. home-cooked meal",
    "marvel vs. harry potter",
    "sunrise vs. sunset",
    "ice cream vs. frozen yogurt",
    "beach vs. pool",
    "sneaker vs. high heel",
    "coffee vs. energy drink",
    "pirate vs. ninja",
    "video game vs. outdoor sport",
    "superhero vs. villain",
  };

  //REGULAR CHAT
  static const Set<String> regularChatTopics = {
    //nouns
    "cats",
    "books",
    "trees",
    "chairs",
    "spoons",
    "clouds",
    "cars",
    "phones",
    "shoes",
    "flowers",
    "lamps",
    "rivers",
    "hats",
    "pillows",
    "keys",
    "guitars",
    "cakes",
    "oceans",
    "mountains",
    "birds",
    "computers",
    "tables",
    "wallets",
    "clocks",
    "mirrors",
    "balls",
    "suns",
    "doors",
    "cameras",
    "moons",
    "houses",
    "bikes",
    "cookies",
    "bridges",
    "bags",
    "pens",
    "butterflies",
    "fish",
    "stars",
    "trains",
    "windows",
    "cups",
    "letters",

    //scary
    "haunted houses",
    "ghost encounters",
    "urban legends",
    "serial killers",
    "dark alleys",
    "demonic possessions",
    "creepy dolls",
    "abandoned asylums",
    "supernatural phenomena",
    "nightmares",
    "cemeteries",
    "paranormal investigations",
    "horror movies",
    "monsters",
    "vampires",
    "witches and witchcraft",
    "mysterious disappearances",
    "cryptids (e.g., Bigfoot, Loch Ness Monster)",
    "ouija boards",
    "shadow figures",
    "sleep paralysis",
    "cults and cult leaders",
    "psychopathic behavior",
    "cursed objects",
    "bloody legends and myths",
    "alien abductions",
    "dark rituals",
    "possessed objects",
    "insane asylums",
    "spooky encounters in the woods",
    "eerie sounds in the night",
    "unsolved mysteries",
    "fear of the dark",
    "claustrophobia",
    "encounters with the unknown",
    "haunted forests",
    "chilling urban exploration experiences",
    "supernatural curses",
    "strange and unexplained phenomena",
    "terrifying dreams",
    "unsettling historical events",
    "abnormal psychological conditions",
    "bloodcurdling screams",
    "phobias",
    "eerie coincidences",
    "night terrors",
    "freak accidents",
    "possessed individuals",
    "cursed places",
    "malevolent spirits",

    //funny
    "awkward moments",
    "funny pet stories",
    "jokes and puns",
    "silly childhood memories",
    "embarrassing situations",
    "pranks and practical jokes",
    "memes and viral internet trends",
    "funny movie quotes",
    "hilarious travel mishaps",
    "weird food combinations",
    "funny autocorrect fails",
    "comical misunderstandings",
    "unusual talents and skills",
    "funny animal videos",
    "ridiculous fashion trends",
    "amusing typos and spelling mistakes",
    "funny work anecdotes",
    "laughable fashion disasters",
    "bloopers and outtakes from movies and TV shows",
    "funny moments caught on camera",
    "funny dance moves",
    "amusing misheard lyrics",
    "funny product reviews",
    "funny family stories",
    "goofy selfies and photos",
    "funny celebrity encounters",
    "awkward and funny first date stories",
    "funny sports moments",
    "hilarious quotes from kids",
    "funny YouTube videos and channels",
    "funny auto-correct text messages",
    "funny misinterpretations and misunderstandings of instructions",
    "laughable holiday mishaps",
    "funny parenting moments",
    "funny voice impressions",
    "silly and humorous inventions",
    "funny TV show moments",
    "comical internet memes",
    "funny fails and accidents",
    "awkward social encounters",
    "funny quotes from comedians",
    "funny book and comic excerpts",
    "silly puns and wordplay",
    "funny bumper stickers and signs",
    "hilarious moments from stand-up comedy shows",
    "funny coincidences",
    "amusing pick-up lines",
    "funny classroom experiences",
    "funny song parodies",
    "hilarious reactions to surprises and pranks",

    //movies
    "the movie 'Inception'",
    "the movie 'The Social Network'",
    "the movie 'Interstellar'",
    "the movie 'Mad Max: Fury Road'",
    "the movie 'Whiplash'",
    "the movie 'La La Land'",
    "the movie 'The Wolf of Wall Street'",
    "the movie 'The Avengers'",
    "the movie 'Gone Girl'",
    "the movie 'Black Swan'",
    "the movie 'Gravity'",
    "the movie 'The Grand Budapest Hotel'",
    "the movie 'Birdman'",
    "the movie 'Get Out'",
    "the movie 'Dunkirk'",
    "the movie 'The Shape of Water'",
    "the movie 'Her'",
    "the movie 'Moonlight'",
    "the movie 'Arrival'",
    "the movie 'The Martian'",
    "the movie 'The Revenant'",
    "the movie 'Ex Machina'",
    "the movie 'Drive'",
    "the movie 'Captain America: The Winter Soldier'",
    "the movie 'Black Panther'",
    "the movie 'Avengers: Infinity War'",
    "the movie 'Joker'",
    "the movie 'The Imitation Game'",
    "the movie 'The Fault in Our Stars'",
    "the movie 'Inside Out'",
    "the movie 'Coco'",
    "the movie 'The Lego Movie'",
    "the movie 'The Big Short'",
    "the movie 'Hereditary'",
    "the movie 'A Star is Born'",
    "the movie 'Baby Driver'",
    "the movie 'The Greatest Showman'",
    "the movie 'Blade Runner 2049'",
    "the movie 'Logan'",
    "the movie 'The King's Speech'",
    "the movie 'Moonrise Kingdom'",
    "the movie 'The Hateful Eight'",
    "the movie 'Inside Llewyn Davis'",
    "the movie 'Manchester by the Sea'",
    "the movie 'Three Billboards Outside Ebbing, Missouri'",
    "the movie 'Call Me by Your Name'",
    "the movie 'A Quiet Place'",
    "the movie 'Parasite'",

    //mythical beings
    "Dragons",
    "Unicorns",
    "Phoenixes",
    "Mermaids",
    "Centaurs",
    "Griffins",
    "Cyclopes",
    "Werewolves",
    "Vampires",
    "Minotaurs",
    "Hydras",
    "Sirens",
    "Pegasi",
    "Krakens",
    "Banshees",
    "Fauns",
    "Satyrs",
    "Chupacabras",
    "Bigfoots",
    "Yetis",
    "Loch Ness Monsters",
    "Medusas",
    "Gorgons",
    "Trolls",
    "Fairies",
    "Goblins",
    "Dwarves",
    "Ogres",
    "Nymphs",
    "Kitsune",
    "Valkyries",
    "Thunderbirds",
    "Kelpies",
    "Wendigos",
    "Basilisks",
    "Cerberi",
    "Golems",
    "Jackalopes",
    "Jersey Devils",
    "Elves",
    "Leprechauns",
    "Djinn",
    "Genies",
    "Satanic Goats",
    "Manticores",
    "Harpies",
    "Wraiths",
    "Vampiric Pterosaurs",
    "Tengus",
    "Simurghs",
    "Bakus",
    "Nagas",
  };

  //when she/he ...
  static Set<String> momentsRegularChatTopics({
    required String subjectPronoun,
    required String possessivePronoun,
  }) =>
      {
        "when $subjectPronoun tripped and fell in public",
        "when $subjectPronoun forgot someone's name right after being introduced",
        "when $subjectPronoun accidentally sent a text to the wrong person",
        "when $subjectPronoun got food stuck in $possessivePronoun teeth during an important conversation",
        "when $subjectPronoun farted in a quiet room",
        "when $subjectPronoun spilled a drink on someone",
        "when $subjectPronoun experienced wardrobe malfunctions",
        "when $subjectPronoun got caught singing in private",
        "when $subjectPronoun got caught dancing in private",
        "when $subjectPronoun called someone by the wrong name",
        "when $subjectPronoun accidentally sent a screenshot to the person $subjectPronoun screenshotted",
        "when $subjectPronoun accidentally liked an old post while stalking someone on social media",
        "when $subjectPronoun laughed at something inappropriate",
        "when $subjectPronoun laughed at something at the wrong time",
        "when $subjectPronoun got caught with $possessivePronoun zipper down",
        "when $subjectPronoun mispronounced a common word in front of others",
        "when $subjectPronoun accidentally made a loud and embarrassing noise in a quiet room",
        "when $subjectPronoun walked into a glass door",
        "when $subjectPronoun walked into a pole",
        "when $subjectPronoun had $possessivePronoun stomach growl loudly during a quiet moment",
        "when $subjectPronoun forgot someone's birthday",
        "when $subjectPronoun accidentally replied to a message with the wrong response",
        "when $subjectPronoun got caught with toilet paper stuck to $possessivePronoun shoe",
        "when $subjectPronoun sent a message with embarrassing typos",
        "when $subjectPronoun accidentally sent a personal message to a group chat",
        "when $subjectPronoun tripped over $possessivePronoun own words while speaking",
        "when $subjectPronoun got caught with $possessivePronoun fly open",
        "when $subjectPronoun accidentally sent a voice memo to the wrong person",
        "when $subjectPronoun laughed so hard that $subjectPronoun spit out $possessivePronoun drink",
        "when $subjectPronoun got caught taking a selfie in a public place",
        "when $subjectPronoun was caught in an awkward and embarrassing situation while on a video call",
        "when $subjectPronoun got caught in a fashion trend from the past",
        "when $subjectPronoun got caught in an embarrassing outfit",
        "when $subjectPronoun accidentally revealed confidential information",
        "when $subjectPronoun accidentally revealed a secret",
        "when $subjectPronoun slipped on a banana peel",
        "when $subjectPronoun slipped on a wet floor",
        "when $subjectPronoun accidentally liked an old social media post while stalking someone",
        "when $subjectPronoun accidentally commented on an old social media post while stalking someone",
        "when $subjectPronoun said something embarrassing in a quiet room, thinking nobody would hear",
        "when $subjectPronoun got caught talking to an inanimate object as if it were a person",
        "when $subjectPronoun accidentally sent a message to the wrong group chat",
        "when $subjectPronoun had $possessivePronoun phone's voice assistant activate and say something embarrassing in public",
        "when $subjectPronoun got caught dancing to music with $possessivePronoun headphones on",
        "when $subjectPronoun accidentally shared a private photo on a public platform",
        "when $subjectPronoun accidentally tripped over $possessivePronoun own feet while walking",
        "when $subjectPronoun got caught daydreaming and not paying attention to a conversation",
        "when $subjectPronoun accidentally sent a screenshot of a private conversation to the person $subjectPronoun were talking about",
        "when $subjectPronoun accidentally shared a search history during a presentation",
        "when $subjectPronoun accidentally shared a search history during screen sharing",
        "when $subjectPronoun got caught with food in $possessivePronoun teeth during a date",
        "when $subjectPronoun got caught with food in $possessivePronoun teeth during an important meeting",
        "when $subjectPronoun accidentally left a voice message on someone's phone without realizing it",
        "when $subjectPronoun laughed uncontrollably at something that wasn't intended to be funny",
        "when $subjectPronoun accidentally sent a text complaining about someone to the person $subjectPronoun were complaining about",
        "when $subjectPronoun got caught singing a song that $subjectPronoun didn't know the lyrics to",
        "when $subjectPronoun got caught dancing to a song that $subjectPronoun didn't know the moves to",
      };
}
