import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ko', 'en', 'ja', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? koText = '',
    String? enText = '',
    String? jaText = '',
    String? zh_HansText = '',
  }) =>
      [koText, enText, jaText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'bl2hbhgj': {
      'ko': '영어의 전설',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'rfe8gh9f': {
      'ko': '\n\n영어의 전설_기본편',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zyrywx7o': {
      'ko': '영어 공부, 어떻게 해야 하는가?',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tor0e4b8': {
      'ko':
          '현대인들은 대학입시, 승진, 취미, 정보획득 등의 다양한 목적을 위해 필수적으로 영어를 공부하고 있습니다.\n\n영어는 앵글로색슨족, 라틴족, 게르만족의 세 종족이 얽혀 만들어진 언어 입니다. 영어권 나라 사람들의 사고방식을 이해하면 영어는 훨씬 쉬워집니다. 효율적인 영어공부를 위해, \'영어적 마인드\'를 체계적으로 학습할 수 있도록 내용을 구성하였습니다.\n\n본 어플리케이션은, 커리큘럼을 정해진 대로 소화하면 누구든 원하는 목표를 달성할 수 있도록 구성되어 있습니다. 추가적인 교재 없이 본 어플리케이션 만으로도 충분히 학습이 가능하도록 목적에 따라 버전을 다르게 구성해두었으니, 목적에 맞는 버전을 수강하시면 보다 효율적인 학습이 가능할 것입니다.\n\n \'기본편\'은 영어에 대한 기본기가 부족한 분들이 영어의 기본기를 채우기 위한 난이도 입니다. 오픽/수능/토익/토플 등의 시험을 준비중이시라면, 해당 목적에 맞는 커리큘럼의 버전을 다운받아 학습하시는 것을 권장드립니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5ggpptis': {
      'ko': '* 토익,수능,오픽편 2023년 5월 중 출시예정.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'dehwswhk': {
      'ko': '공부방법',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5476vmup': {
      'ko': 'Start',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zy28bybw': {
      'ko': '\n\n\n\n\n',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Main
  {
    'ajvo5w85': {
      'ko': '영어의 전설',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'g9upur1m': {
      'ko': '기본기 수련',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'nlh28xqa': {
      'ko': 'Word',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zwi4d2ih': {
      'ko': 'Listening',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'pkx7uwho': {
      'ko': 'Reading',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'oym5pi6o': {
      'ko': 'Grammer',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // ME
  {
    'nibbbdrs': {
      'ko': '영어의 전설',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'vmger5qx': {
      'ko': 'Hello,',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wq7tp9j5': {
      'ko': 'English!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ygg6hirc': {
      'ko': '진도 관리 화면입니다 :)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'von613me': {
      'ko': 'tracker',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '971f077x': {
      'ko': 'Word',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'a9qbg61s': {
      'ko': 'Progress',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '8kc4imr2': {
      'ko': 'tracker',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '183j5o7d': {
      'ko': 'Listening',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ym2rssa2': {
      'ko': 'Progress',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'okry254j': {
      'ko': 'tracker',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ipowtouo': {
      'ko': 'Reading',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'busuxm0g': {
      'ko': 'Progress',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ra1m9n8k': {
      'ko': 'tracker',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mmpgy249': {
      'ko': 'Grammer',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'gv3ynf1l': {
      'ko': 'Progress',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Listening
  {
    '283l2e4r': {
      'ko': 'Listening',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5o51m8pt': {
      'ko': '오리엔테이션',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ee997b78': {
      'ko': 'week1. 기본 문장구조',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'vo0w3qwo': {
      'ko': 'Week2. 동사변형    ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'j998k1az': {
      'ko': 'Week3. 관계사      ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jflq70i6': {
      'ko': 'Week4. 접속사 활용. ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // howToUse
  {
    'cw05ill5': {
      'ko': '영어의 전설',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'r3czsuqn': {
      'ko': '사용방법',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hh7ypl86': {
      'ko': '앱 소개',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'g5v7bx6v': {
      'ko': '공부방법',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'fehlbk7b': {
      'ko': '영어 기본 마음가짐',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'v8y8lo7u': {
      'ko': '커리큘럼',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // L1
  {
    'ahjtlyro': {
      'ko': 'week1',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ov0oagmn': {
      'ko': '기본 문장 구조',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    's02f7t2l': {
      'ko': ' 완료 횟수 : ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9ux1cwc9': {
      'ko': 'finish',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Word
  {
    '8w6vwint': {
      'ko': 'word',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'b9suw7p1': {
      'ko': 'Day1',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '6qt7w3x6': {
      'ko': 'Day1',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '94yj8qqc': {
      'ko': 'Day2',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'vboy6yyz': {
      'ko': '2',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'fin5prf2': {
      'ko': 'Day2',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'a5mil6xt': {
      'ko': '2',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5mam4u9e': {
      'ko': 'Day3',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'g4z4tur2': {
      'ko': '3',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'h7avzx1k': {
      'ko': 'Day3',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'vuiklqq5': {
      'ko': '3',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hbcsvo40': {
      'ko': 'Day4',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'p3ivdxgo': {
      'ko': 'Day4',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'nhmm04mm': {
      'ko': 'Day5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'oma92us9': {
      'ko': 'Day5',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'u0d9cu6a': {
      'ko': 'Day6',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'kmb9vg15': {
      'ko': 'Day6',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3a2kv0y2': {
      'ko': 'Day7',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'i3lh0gxf': {
      'ko': 'Day7',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'fc2x8drz': {
      'ko': 'Day8',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ddwdqjm7': {
      'ko': 'Day8',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wq6bl345': {
      'ko': 'Day9',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'miwnugmd': {
      'ko': 'Day9',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0ucdd1qc': {
      'ko': 'Day10',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '8p4kh9gq': {
      'ko': 'Day10',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '7iynuabr': {
      'ko': 'Day11',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ghadhck9': {
      'ko': 'Day11',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'c3rrp7la': {
      'ko': 'Day12',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'kz864yqq': {
      'ko': 'Day12',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'dm6946xp': {
      'ko': 'Day13',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'l78aueh4': {
      'ko': 'Day13',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'grssbcvy': {
      'ko': 'Day14',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4c7tmy57': {
      'ko': ' Day14',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'l33b0yl5': {
      'ko': 'Day15',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9rl3jenc': {
      'ko': 'Day15',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3rf0h4a0': {
      'ko': 'Day16',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9gg87zi5': {
      'ko': 'Day16',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'obcjvr7u': {
      'ko': 'Day17',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '6isgzmhe': {
      'ko': 'Day17',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'cx7yi70k': {
      'ko': 'Day18',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'z08tar4m': {
      'ko': 'Day18',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ubfxa855': {
      'ko': 'Day19',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '7gnr3xgr': {
      'ko': 'Day19',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3nkqvs0o': {
      'ko': 'Day20',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '8yvik7rz': {
      'ko': 'Day20',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    's3gjz14v': {
      'ko': 'Day21',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'rbwb4eba': {
      'ko': 'Day21',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3xz6kdzy': {
      'ko': 'Day22',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'pvvvpph1': {
      'ko': 'Day22',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'goj8o9x9': {
      'ko': 'Day23',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0js7ubt1': {
      'ko': 'Day23',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'rh9cn7kn': {
      'ko': 'Day24',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '26qf69s7': {
      'ko': 'Day24',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '30essygl': {
      'ko': 'Day25',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'o9bg9usw': {
      'ko': 'Day25',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'gth8wzvd': {
      'ko': 'Day26',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'rx0wqdne': {
      'ko': 'Day26',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zwcwnwyg': {
      'ko': 'Day27',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'b58civ1y': {
      'ko': 'Day27',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jdys7kay': {
      'ko': 'Day28',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1lqh09g8': {
      'ko': 'Day28',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'eqcwzt0z': {
      'ko': 'Day29',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3tm3e6n5': {
      'ko': 'Day29',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'g3dnvfo4': {
      'ko': 'Day30',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'y6zubx3d': {
      'ko': 'Day30',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lkfkobom': {
      'ko': '인사 메시지',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // introduce
  {
    '8hx2w03c': {
      'ko': '앱 소개',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tvym3foy': {
      'ko': '영어의전설_기본편',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'w5r299l7': {
      'ko':
          '영어공부를 시작하려고 해도, 대부분의 사람들은 기본기가 부족해 시행착오를 겪게 되며 공부방법을 바꿔가는 비효율적인 과정을 겪게 됩니다.\n\n영어의 4가지 영역(Reading, Listening, Writing, Speaking)이 모두 \'다른 과목\' 이라는 것을 인지하고, 내가 원하는 것이 무엇인지를 분명하게 한 후 영어공부를 하는 것이 가장 효율적입니다.\n\nLA에서 10년을 살고도 영어로 말을 못하는 사람이 있는 반면, 한국에서 독학했음에도 외국인과 유창하게 대화하는 사람도 있습니다. 필자도 또한 한국에서 나고 자랐지만 연습만으로 프리토킹이 가능하게 되었습니다.\n\n수능, 토익, 오픽 등의 고난이도의 영어시험을 준비하기에 앞서, 기본기가 부족하신 분들을 위해 기본편을 먼저 제작하였습니다. 기본편의 단어수준은 한국 교육과정 기준 초-중등 수준이며, 수능과 같은 더 높은 수준의 시험을 위해서는 그에 걸맞는 수준의 단어를 추가적으로 학습해야 합니다.\n(수능편, 토익편, 오픽편에서 필요한 단어들을 추가로 구성해 두었습니다.)\n\n영어 기본기 체화에 있어서는 어떤 목적으로 공부를 하더라도 충분히 이 어플리케이션 만으로도 학습이 충분할 것임을 자신드립니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'b07ek1m7': {
      'ko':
          '* 기본문법 및 문장패턴만 빠르게 정리하고 싶으신 분들은 기본편의 Word 및 Listening을 스킵하시는 것을 권장드립니다.\n(수능영어 2등급 이상 경험자)\n\n기본편의 Word 및 Listening은 영어에 기초가 전혀 없는 사람들을 기준으로 구성되어 있습니다.\n\n\n\n\n\n\n\n\n\n\n\n',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'u934lo5y': {
      'ko': 'Hello World',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // wordDay
  {
    'fxf7v0gc': {
      'ko': 'Day',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'dbttsgjv': {
      'ko': 'Go exam',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // course
  {
    '6utgypn9': {
      'ko': '커리큘럼',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xy46h0uv': {
      'ko': '영어의전설 시리즈',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // mindset
  {
    'd42i2evx': {
      'ko': '앱 소개',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'r5ucdhan': {
      'ko': '기본 마음가짐',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'v3kw0l2i': {
      'ko': '다음의 마음가짐을 ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zhf7ay7e': {
      'ko': '꼭',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9nlaujtq': {
      'ko': ' 명심하세요',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'nbsmlpc5': {
      'ko': '1. 지치더라도 매일매일',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0ijkthtd': {
      'ko':
          ' 공부가 지치더라도 조금씩이라도  매일 해야합니다.\n정 공부가 하기 싫은 날이 있더라도, 목표를 설령 채우지 못하는 날이 있더라도, 10분이라도 공부하세요.\n(특히, Listening은 꾸준함이 가장 중요합니다.)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'h7on6xe3': {
      'ko': '2. 영어권 나라와 한국의 사고방식 차이',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'te3sl2yy': {
      'ko':
          ' 한글은 본론을 나중에 말하는 경향이 있습니다. 영어권 나라 사람들은 기본적으로 \'본론을 가장 먼저 이야기하려는\' 사고방식을 가지고 있습니다.\n이러한 이유에 의거하여 모든 문법요소들이 생겨났고, 어순의 차이가 발생합니다. ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lav5b9sk': {
      'ko':
          '* 그렇기에, 영어를 한글로 번역하려는 습관을 버리세요. 안좋은 습관을 가중시킵니다. \n(한글을 영어로 바꾸는 것은 좋습니다.)\n영어를 그 자체로 받아들이는 연습을 해야합니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'e0gxz0my': {
      'ko': '3. 조바심을 버리기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '03wad4zx': {
      'ko':
          ' 새 친구를 사귀면, 처음엔 이름을 계속 까먹다가 시간이 지나면 자연스럽게 이름을 외우게 됩니다.\n자전거를 처음 타도, 처음에는 균형 잡기도 힘들지만 시간이 지나면 자연스럽게 자전거를 타게 됩니다.\n영어공부를 시작한 초창기에 조바심이 나는건 당연한 현상입니다. 영어가 당연한 것이 될 때 까지, 조바심이라는 감정에 휘둘리지 않는 것이 영어공부에서는 가장 중요합니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tmmr8q2i': {
      'ko': '4. 타인의 의견 맹신 금지',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xudj7rd6': {
      'ko':
          ' \"유학을 가지 않으면 결국 영어는 한계가 있어!\"라고 주장하는 사람들이 간혹 있습니다. 개인적인 의견을 말씀드리면, 반은 맞고 반은 틀린 주장이라고 생각합니다.\n언어를 현지인처럼 사용하는 것은 결국 습관의 영역입니다. 21세기는 편리함의 시대입니다. 영상으로 외국의 것을 접하고, 주변 환경을 영어권 나라와 다르지 않게 만드는 것은 현 시대에서는 결코 어렵지 않습니다.\n그렇기에 과거의 주장, 의견을 맹신하지 않고 꾸준하고 효율적이게 공부하신다면 어떤 목적의 경부를 하시든 목표를 이루실 수 있을 것이라 자신드립니다',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ds5no9z9': {
      'ko': '\n\n\n\n\n\n\n\n',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Reading
  {
    'tpgfo7mc': {
      'ko': 'Reading',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'avkhfpoa': {
      'ko': 'Level',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0tv944o5': {
      'ko': 'Start!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'z7ikk0g9': {
      'ko': 'Start!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'fqmneqri': {
      'ko': '앞으로의 방향성',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // ROT
  {
    'v8zis0in': {
      'ko': '수고하셨습니다 :)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'c23qvxuh': {
      'ko': '영어 읽기 기본기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4eerurux': {
      'ko':
          '수능, 토익, 토플 등 다양한 영어 읽기 시험에서는 빠른 속도로 정확하게 영어 지문을 읽어나가는 능력을 필요로 합니다.\n\n단어를 많이 외우는 것이 가장 기본입니다.\n문법 공부나 Listening 경험을 늘리는 것은, 심화 영어 읽기에 도움이 안된다는 것은 이미 많은 분들이 이해하고 있습니다.\n',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5uescybn': {
      'ko':
          '심화 독해 시험에서는, 문법이나 틀에 얽메이는 것이 아닌, 빠른 시간내에 정확하게 정보를 뽑아내는 것이 핵심입니다.\n\n본 과정을 수료하셨다면, 원하시는 시험 수준의 지문 Reading 으로 바로 넘어가신 후 공부를 시작하세요. ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tuevf4ba': {
      'ko': '독해 연습 핵심',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'vaf7wm0u': {
      'ko':
          '1. 영어를 몰라도 한글로라도 읽기. \n* 지문 상황파악이 우선\n2. 2번쨰 읽을땐 영어도 같이 읽기.\n3. 3번째부턴 최대한 영어 위주로 읽기.\n4. 모르는 단어를 최대한 유추해보기.\n5. 인상깊은 표현은 따로 정리.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // L2
  {
    '7i2e0ftu': {
      'ko': 'Week2',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0coil0ju': {
      'ko': '동사 변형 (시제)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zljra0ki': {
      'ko': ' 완료 횟수 : ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lqn96jxr': {
      'ko': 'finish',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // L3
  {
    'vuo102wy': {
      'ko': 'Week3',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ebd33jan': {
      'ko': '관계사',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'bc0ti37a': {
      'ko': ' 완료 횟수 : ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5hgzd10p': {
      'ko': 'finish',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // L4
  {
    '37z7595x': {
      'ko': 'Week4',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '8fjyes9d': {
      'ko': '접속사 활용',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'qwtl3lq4': {
      'ko': ' 완료 횟수 : ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9q3c6kzt': {
      'ko': 'finish',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // ReadingMain
  {
    'jnu3xc39': {
      'ko': 'Level',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'atc7z9f4': {
      'ko': 'finish',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lsxbshmv': {
      'ko': '영어',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'cghxm1xi': {
      'ko': '영한',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Grammer
  {
    '83ypxowb': {
      'ko': 'Grammer',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '7q1w4ztx': {
      'ko': '오리엔테이션',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4pgu1mdt': {
      'ko': 'week1. 기본 문장구조',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3arefy44': {
      'ko': 'Week2. 동사변형    ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mpkk7wst': {
      'ko': 'Week3. 관계사      ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2g1k1sh1': {
      'ko': 'Week4. 접속사 활용. ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // G1
  {
    'mcse2qtx': {
      'ko': 'Week1. 기본 문장구조',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ucertlxl': {
      'ko': '기본 문장구조',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'p9r2itmb': {
      'ko':
          '\"민수가 밥을 먹는다\" -> \"민수가 먹는다 밥을\"\n\n 모든 언어는, 그 민족이 중요하다고 여기는 것이 더 앞에 나옵니다. \"민수가 영희를 좋아한다\"라는 상황이 있을 때, 한국인들은 민수와 영희의 관계에 초점을 맞추는 반면, 영어권 나라의 사람들은 \"민수가 누군가에게 좋아하는 감정을 느끼고 있다\"는 것에 초점을 맞춥니다.\n\n 모든 문장은 결국 이야기입니다. 머릿속에 있는 어떤 내용을 상대방에게 전달하기 위해 문장을 만들고, 그 문장이 모여 문단이 됩니다.\n\n한국인들이 알고있는 문법은, 일본이 정리해둔 영어를 가져와 번역을 한 \'성문종합영어\'에 기반을 둡니다. 너무 오래되기도 했고, 엄밀함에는 장점이 있을 수 있지만 영어 독해에 있어서는 오히려 걸림돌이 되기도 하지요. \n\n 간단한 회화가 목적이거나, 영어로 된 글을 듣고 읽을때 내용 이해에 초점을 두시는 분들은 본 어플에서 다루는 문법만을 알아도 충분합니다. 하지만, 더 자세한 문법을 공부하고 싶으시다면 \'문법편\'도 같이 공부하시는 것도 추천드립니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ehhfuni2': {
      'ko': '구와 절',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'y4emh656': {
      'ko': '구는, 명사 하나와 그 명사를 수식하는 부분들이 합쳐진 부분을 의미합니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'r39cxu0l': {
      'ko':
          '잘생긴 민수\nhandsome minsu\n\n푸르스름하고 달콤한 포도\nquite blue and sweet grape\n\n초조해하는 수정이\nnervous sujeong',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '08fc2sxv': {
      'ko': '절은, 대상과 동작까지 포함된 부분까지를 의미합니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ic8c3uvg': {
      'ko':
          '민수와 축구하는 것\nplaying soccer with minsu.\n\n빨래하는 것\ndoing laundry\n\n나는 잠자고 공부했어.\ni slept and studied.\n* i slept : 절1\n* studied : 절2 ▻ 절의 갯수와 동사의 개수는 같음.\n',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'o7406cnj': {
      'ko': '동사의 특징에 따른 문장 구성 변화.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'dibudcsg': {
      'ko': '문장에서 핵심은 \'동사\' 입니다.\n동사에 따라 필요한 요소들이 정해집니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'guw9h84x': {
      'ko':
          '나는 죽는다.(O)\n\n나는 때린다.(X)\n  ▪︎누구를 떄리는지가 있어야함.\n     ‣ 나는 범죄자를 때린다.(O)\n  \n민수가 먹는다(X)\n   ▪︎뭘 먹는지가 있어야함\n     ‣ 민수가 피자를 먹는다(O)\n\n민수가 보낸다.(X)\n   ▪︎ 무엇을 누구에게 보내는지가 있어야함.\n     ‣ 민수가 보낸다 철수에게 편지를(O)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3o3gw9ac': {
      'ko':
          '문장에서 핵심은 \'동사\' 입니다.\n동사의 성질에 따라 필요한 요소들이 정해집니다.\n\n우리는 한글을 이미 사용할 수 있기 때문에 각각의 동사들이 어떤 요소들을 필요로 하는지 생각해보는 습관을 가진다면 문장을 구성하는 실력이 향상될 것입니다.\n\n1~5형식을 함께 공부해봅시다!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'i7yugdu6': {
      'ko': '1형식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hvobeuxa': {
      'ko': '주어(주인공) + 동사(동작)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tehgyc4n': {
      'ko':
          '나는 죽는다.\ni die.\n\n나는 운동장에 있다.\ni\'m in the playground.\n* in the playground는 부사이기에 문장성분에 포함되지 않음.\n\n나는 존재한다.\ni exist.\n\n그는 노래부른다.\nHe sings.\n\nThey dance.\n그들이 춤춘다.\n\nI swim in the river.\n나는 강에서 수영한다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'yizmxzcg': {
      'ko':
          '* on, in, around 등을 \'전치사\'라고 해요.\n이미 필요한 문장성분이 끝났음에도, 추가적으로 더 넣고싶은 말이 있을때 사용하는 단어에요.\n그렇기에 문장 성분에 포함되지 않아요.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    's5zgaycs': {
      'ko': '2형식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '7urhqu1t': {
      'ko': '주어 + 동사 + 주격보어',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '98xknzig': {
      'ko':
          '그녀는 행복해 보인다.\nShe looks happy.\n\n그는 피곤해 보인다.\nHe seems tired.\n\n그들은 자신있게 나타났다.\nThey appear confident.\n\n음식이 맛있는 냄새 난다.\nThe food smells delicious.\n\n하늘이 어둡게 변했다.\nThe sky turned dark.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'rsazg32d': {
      'ko':
          '* 주격보어는 주어를 보충설명해주는 단어에요. \n주어를 보충설명해주는 단어가 꼭 필요한 동사들을 사용할때는 문장을 이렇게 구성하면 돼요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wxuveegr': {
      'ko': '3형식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'yrrvdt92': {
      'ko': '주어 + 동사 + 목적어',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '8pjcdtnh': {
      'ko':
          '나는 사과를 먹었다. \nI ate an apple.\n\n그녀는 소설을 썼다. \nShe wrote a novel.\n\n우리는 빵을 구입했다. \nWe bought bread.\n\n그들은 집을 청소한다. \nThey clean the house.\n\n나는 영화를 본다. \nI watch a movie.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'l8nxaz5w': {
      'ko':
          '* 목적어는 동작의 목적이 되는 단어에요!\n\'먹다\' 의 경우, 뭘 먹었는지가 없으면 이야길가 성립될 수 없죠. 이런 단어를 \'목적어\' 라고 해요.\n* 목적어가 필요한 동사를 \'타동사\'라고 해요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mtcvmtbw': {
      'ko': '4형식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'nwnnmibo': {
      'ko': '주어 + 동사 + 간접 목적어 + 직접목적어',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'cue9d55g': {
      'ko':
          '나는 친구에게 선물을 줬다. \nI gave a present to my friend.\n\n그녀는 아이들에게 이야기를 해줬다. \nShe told a story to the kids.\n\n우리는 학생들에게 과제를 내려줬다. \nWe assigned homework to the students.\n\n그는 아내에게 꽃을 선물했다. \nHe gave flowers to his wife.\n\n나는 엄마에게 전화를 걸었다. \nI called my mom.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hi676a3n': {
      'ko': '* \'보내다\' 같은 동사는, 누구에게 무엇을 보내는지 필요하죠. 이런 종류의 동사를 \'수여동사\'라고 해요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'gwzrw53w': {
      'ko': '5형식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'pju0o8lr': {
      'ko': '주어 + 동사 + 목적어 + 목적격보어',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3q182btt': {
      'ko':
          '그녀는 그 책을 지루하다고 생각했다.\nShe thought the book was boring.\n\n나는 그 문제를 어렵다고 느꼈다. \nI felt the problem was difficult.\n\n우리는 그 노래를 아름답다고 생각한다.\n We think the song is beautiful.\n\n그들은 그 계획을 위험하다고 판단했다. \nThey judged the plan as risky.\n\n나는 그것을 불가능하다고 생각하지 않는다.\nI don\'t think it is impossible.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'x5k9ii14': {
      'ko':
          '* \'생각하다\' 같은 경우, \'무엇을\' \'어떻게\' 생각하는지가 있어야겠죠? 가령, \"나는 철수를 잘생겼다고 생각한다.\"의 경우, (나, 철수, 잘생겼다) 의 세가지를 필요로 하네요.\n\n 이렇게 목적어에 대한 보충설명을 필요로 하는 동사를 5형식 동사라고 해요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'y5yl8cq8': {
      'ko': 'finish',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // G2
  {
    '5thnd8ql': {
      'ko': 'week2. 동사변형',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'c6qsdm4d': {
      'ko': 'Be동사와 일반시제',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jq6763h5': {
      'ko': ' i play drum.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'e89yvr7v': {
      'ko':
          '위의 문장은, 내가 현재 드럼을 치고 있다는 의미가 아닙니다. \"나는 드럼을 치는 사람이야.\"라는 본인의 성향에 대해 알려주는 내용입니다.\n\n 즉, 현재 시제는 실제로는 현재 시점에서 하고 있다는 의미가 아닌, 본인의 성질에 대한 내용을 설명해주는 것입니다.\n\n 실제로 현재 시점의 이야기를 하기 위해선 \'현재분사\' 라는 것을 사용해야 합니다. 이에 대해서는 분사 파트에서 다루도록 하겠습니다.\n\n Be동사도 또한 주어의 성질에 대해 설명해주는 동사입니다.\ni\'m a boy. -> 나는 소년이다.\n\n즉, [ 주어 + be동사 + (무언가) ] 의 구조에서는, 주어의 보충설명의 내용이 (무언가)라는 것입니다. \n\nthere is rainy.\n-> 그곳은 비오는 곳이다.\n\n그냥 \'비가 온다\' 라고 해석하여도 되지만, be동사의 성질을 더 잘 이해하기 위해 이러한 방식으로 받아들이시는 것을 추천드립니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'qbzid8ca': {
      'ko': '과거형, 미래형',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '4p0d46re': {
      'ko':
          '과거형이나 미래형은 이전이나 이후 시점의 이야기를 서술하기 위해 사용됩니다.\n\n일반적인 경우에는 동사에 -d나 -ed를 붙여 과거형을 만듭니다.\n\n그런데 영어는 다양한 민족이 모여 만든 언어이니 만큼, 사실 어원이 어디서 왔냐에 따라 과거형의 번형 형태는 꽤 다릅니다.\n\n그렇기에 \'불규칙 동사\'라고 불리우는 과거형들이 많이 생겨났는데, 이런 부분들을 따로 외우기보단, 듣기든 읽기든 경험을 쌓아 당연한 것으로 만드는 것이 효율적입니다.\n\n일반적인 과거형 : -d 또는 -ed\n\tlove -> loved\n\tdie -> died\n\tlook -> looked\n\n미래형 : 동사 앞에 will\n\tlove -> will love\n\tdie -> will die\n\tlook -> will look',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'x74cobkv': {
      'ko': '분사',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1yxnj42a': {
      'ko': '경우에 따라서는 동사를 형용사로 바꿔야 할 경우가 종종 있습니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'aiccbf34': {
      'ko':
          '죽다 -> 죽이는(현재분사), 죽은(과거분사)\n치우다 -> 치우는(현재분사), 치워진)\n옮기다 -> 옮기는(현재분사), 옮겨진(과거분사)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'cwn8gonm': {
      'ko':
          '위 3개의 예시를 이해하면, 현재분사와 과거분사가 무엇인지 이해하실 수 있으실 것입니다.\n\n현재분사는 동사에 -ing를 붙여서 만듭니다.\n과거분사는 보통은 동사에 -ed를 붙여서 만들지만, 불규칙적으로 변하는 동사도 많습니다.\n\n 이 또한 경험을 통해 자연스럽게 숙지하는 것이 효과적입니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ofvazde7': {
      'ko': '동명사',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ipmn0rpp': {
      'ko': '죽다 -> 죽는 것\n밥먹다 -> 밥먹는 것\n좋아하다 -> 좋아하는 것',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'iqd5lgd2': {
      'ko':
          ' 우리는 동사를 명사화 시켜야 할 경우도 있습니다.\n이런 경우에, 다음 페이지에 나올 to 부정사를 이용해도 되지만 동명사를 이용할 수 있습니다.\n\n동명사도 동사에 -ing를 붙여 만들기에 현재분사와 헷갈릴 수 있습니다.\n구별하는 방법은 다음과 같습니다.\n\n-ing + 명사 :\n\t현재분사로 사용됨. (~하는 명사)\n\tex. playing minsu : 연주하는 민수\n\n~~~~ -ing :\n\t동명사로 사용됨. (~하는 것)\n\tex. practically speaking : 실용적으로 말하는 것',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'qamzcgqu': {
      'ko': 'To 부정사',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jumivz1c': {
      'ko': '죽이다.\n -> 죽이는 것, 죽이기 위해',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'oqos91nk': {
      'ko':
          '동사를 명사, 형용사, 부사 등 다양한 품사로 변환하기 위해 사용됩니다.\n\n명사로 사용될 경우 \'~하는 것\'으로 해석되고, 형용사나 부사로 사용될 경우 \'~하기 위해\'로 해석됩니다. 기본 문장구조에서 배운 것 처럼, to 부정사 부분이 문장에서 어떤 역할로 사용되었는지 이해하고 적절하게 해석하면 보다 효과적으로 to 부정사를 이해하실 수 있을 것입니다.\n\n기존 교과과정에서와 같이, 형용사적 용법과 부사적 용법을 구별하는 것은 효율적이지 않습니다. 해석이 동일하게 되는 만큼, 실용 독해와 듣기를 위해서는 두가지를 같은 것으로 받아들이는 것이 더 편하실 것입니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'tjdmpl7h': {
      'ko': 'finish',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // G3
  {
    '3g3ienwb': {
      'ko': 'week3. 관계사',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'uvt2vrs8': {
      'ko': '관계사 기본',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '9qcnup2m': {
      'ko': '나는 사랑해 영희를 (나를 사랑해주는)\ni love 영희 who love me.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'x0m4dpev': {
      'ko':
          '영어는 기본적으로 문장을 항상 두괄식으로 사용하는 것을 선호합니다.\n\n즉, 본론을 항상 먼저 말하고 상세한 내용을 뒤에서 보충설명 해주는 방식을 선호합니다. 이를 위해 생겨난 문법이 \'관계사\' 입니다.\n\n한글에서는\n\"나는 (나를 사랑해주는) 영희를 사랑해\"라고 이야기합니다.\n영어에서는\n\"나는 영희를 사랑해 (나를 사랑해주는)\"으로, 본론을 다 이야기 한 이후 상세내용을 보충설명해줍니다.\n\nwho, which, that 계열 관계사와\nwhat 계열 (whenever, however 등)의 차이만 이해하면, 관계사를 사용하고 이해하는 데에는 큰 어려움이 없으실 것입니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'pzyj45vw': {
      'ko': 'which, who, that',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'i257pq8o': {
      'ko':
          '나는 갔어 학교(내가 가기 싫어하는)에.\ni went school which i don\'t want to go.\n\n나는 했어 축구(내가 좋아하는)를.\ni played soccer which i like.\n\n나는 좋아해 잠을(내 유일한 취미인).\ni live to sleep which is my only one hobby.\n',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '6mwwgvvg': {
      'ko': '본론이 이미 완성된 시점에서, 어떠한 한 대상에 대한 보충설명을 해주기 위해 이러한 관계사들이 사용됩니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'm4b8gdzz': {
      'ko': 'what, whoever, whenever 등',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1880b11d': {
      'ko':
          '나는 좋아해 (내가 좋아하는 것을)\ni love what i like.\n\n나는 공부를 좋아해 (그게 무엇이든지)\ni love to study whatever it is.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jwexlopm': {
      'ko':
          '관계사 절을 통째로 문장선분으로 넣어줄 때에 이러한 관계사들을 사용합니다. \n\n이 두가지 부류의 관계사의 차이는, 예문과 실제 예문을 접하게 되면 자연스럽게 받아들이게 되실 것입니다. 그러니 걱정하지 마시고, 실제 예문들을 만나는 경험을 늘려보세요.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '6og3h96e': {
      'ko': 'finish',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // G4
  {
    'lhwve3jo': {
      'ko': 'week4. 접속사',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jd13e2j1': {
      'ko': '동사의 특징에 따른 문장 구성 변화.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'koc4prca': {
      'ko':
          '종속접속사는 week3의 관계사와 완벽히 같은 것입니다. 그렇기에 설명을 생략하도록 하겠습니다.\n\n종속접속사가 이미 완성된 문장에서 추가적인 내용을 설명하기 위해 절을 하나 더 붙이는 것이었다고 하면, 등위접속사는 대등한 여러 절을 연결하는 접속사입니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'oiip9za1': {
      'ko':
          '나는 피아노 치고 드럼도 쳐.\ni play piano and play drum.\n\n나는 밥을 사랑하지만 국수는 혐오해.\ni love rice but hate nuddle.\n\ni go busan also i go seoul.\n나는 부산을 가고 또한 서울도 가.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lk6u8yjh': {
      'ko': '절에 대해 제대로 이해하셨다면, 등위 접속사는 결국 절을 연결하는 기능만을 하기에 이해하기에 어렵지 않으실 것입니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'qd2kk8uv': {
      'ko': 'finish',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // GOT
  {
    'y75us2lu': {
      'ko': 'Grammer O/T',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'n39svnpq': {
      'ko': '문법을 대할 때의 마음가짐.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'o5i1rpnb': {
      'ko': '밥이랑 국이랑\n밥과 국',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jjjmhwyc': {
      'ko':
          ' 한국인 중에서도 위의 두가지의 차이를 정확히 이해하고 있는 사람은 많지 않습니다.\n정답은, \'이랑\'은 격식적이지 않은 경우에 사용되고, \'과\'는 격식적인 경우에 사용됩니다.\n\n 영어를 이해하기 위해 필요한 문법요소들이 분명히 존재하지만, 현재 한국 문법은 일제 강점기 이후에 일본의 영어문법을 그대로 가져온 \'성문종합영어\'를 근간으로 하기 때문에 비효율적이면서도 실제 영어와 맞지 않는 부분도 상당히 많습니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hhi2zd4q': {
      'ko': '* 실제 영어를 연구하는 외국인들조차도 한국식 영어문법은 정규 문법으로 취급하지 않습니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'f1lvqznc': {
      'ko':
          ' 독해와 듣기에서 꼭 필요한 문법요소들을 설명해드리고, Listening 파트에서 해당 부분의 연습을 도와드립니다. 본 어플에서 다루는 문법만 숙지해도 내용파악 및 독해에 큰 지장이 없을 것입니다. 특히나 실제 회화를 목표로 하신다면, 본 어플의 문법요소만 숙지하고 경험을 쌓는것을 추천드립니다.\n\n 중요한 것은, 어휘량과 경험입니다.\n엄밀하고 더 깊은 문법을 공부하기를 원하신다면, 문법편을 참고해주세요.\n(2023년 5월 출시예정)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // LOT
  {
    'qb587d1g': {
      'ko': 'Listening O/T',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '8ez795wq': {
      'ko': '영어 듣기 기본기',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'deyqnb70': {
      'ko':
          '영어의 구조를 이해하는 것이 필요하긴 하지만, 영어 듣기에서 가장 중요한 것은 경험입니다. Listening은 귀의 근육으로 하는 것이고, Speaking은 결국 혀의 근육으로 하는 것입니다. 이 말의 깊은 의미를 당장은 이해하기 힘드시겠지만, 경험이 조금만 쌓이면 이게 무슨 의미인지 자연스럽게 이해하게 되실 것입니다.\n\n기본기를 트레이닝하는 1달동안, 하루에 한번씩 각 주간의 듣기 지문을 한번씩 매일 들으세요. 어느샌가 영어의 높낮이, 억양, 템포 등 글로 설명할 수 없는 부분들을 자연스럽게 체화하게 되실 것이고, 시간이 더 지나면 받아쓰기가 될 정도까지 들리실 것입니다.\n\n듣기만큼은, 머리로 하는 것이 아닌 경험과 신경세포들로 하는 것이라는 것을 명심하세요.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Wexam
  {
    'tkj8epkf': {
      'ko': '단어시험',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1d24c3io': {
      'ko': '*뒤로가기 시 맞은문제도 초기화 됩니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'evjh14no': {
      'ko': '푼 갯수 : ',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '05usap7g': {
      'ko': '맞았습니다!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ctbpvixs': {
      'ko': 'submit',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '95os5c9r': {
      'ko': 'finish',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // WordGreet
  {
    '2lhukad3': {
      'ko': 'word 끝',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '7wrgtx76': {
      'ko': '수고하셨습니다!!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'lcduy2mc': {
      'ko':
          '여러분들은 이제 고1 시기까지 필수적으로 알아야 할 모든 어휘량을 학습하셨습니다.\n\n하지만, 어휘량을 늘리는 과정은 더욱 더 필요합니다. 실제 고1까지 필요한 어휘량은 1200개, 고3 수능 응시시 1등급을 확정적으로 받기 위한 최소 어휘량은 5000개, 토익 시험에서 900점 이상을 받기 위한 어휘량은 약 8000개 입니다.\n\n 지금은 이 양이 많아보이시겠지만, 꾸준함을 가지고 성실하게 임하면 된다는 것을, 이 메시지를 보시는 여러분들은 느낌적으로 깨달았으리라 생각합니다.\n\n 여러분들의 영어공부를 진심으로 응원하며, 여기까지 와주신 노력에 진심으로 감사합니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2zkxpfma': {
      'ko': 'finish',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // howToUseContent
  {
    'eszftjic': {
      'ko': '사용방법',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '1lrxv7p8': {
      'ko': '기본 문장구조',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zcq84k1i': {
      'ko': '구와 절',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'hjft5b56': {
      'ko': '구는, 명사 하나와 그 명사를 수식하는 부분들이 합쳐진 부분을 의미합니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0sh9r24j': {
      'ko': '절은, 대상과 동작까지 포함된 부분까지를 의미합니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '7eo0oqcd': {
      'ko':
          '민수와 축구하는 것\nplaying soccer with minsu.\n\n빨래하는 것\ndoing laundry\n\n나는 잠자고 공부했어.\ni slept and studied.\n* i slept : 절1\n* studied : 절2 ▻ 절의 갯수와 동사의 개수는 같음.\n',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'czx6wa9g': {
      'ko': '동사의 특징에 따른 문장 구성 변화.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '15eulhxj': {
      'ko': '문장에서 핵심은 \'동사\' 입니다.\n동사에 따라 필요한 요소들이 정해집니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'yi69la5m': {
      'ko':
          '나는 죽는다.(O)\n\n나는 때린다.(X)\n  ▪︎누구를 떄리는지가 있어야함.\n     ‣ 나는 범죄자를 때린다.(O)\n  \n민수가 먹는다(X)\n   ▪︎뭘 먹는지가 있어야함\n     ‣ 민수가 피자를 먹는다(O)\n\n민수가 보낸다.(X)\n   ▪︎ 무엇을 누구에게 보내는지가 있어야함.\n     ‣ 민수가 보낸다 철수에게 편지를(O)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wjy5btw2': {
      'ko':
          '문장에서 핵심은 \'동사\' 입니다.\n동사의 성질에 따라 필요한 요소들이 정해집니다.\n\n우리는 한글을 이미 사용할 수 있기 때문에 각각의 동사들이 어떤 요소들을 필요로 하는지 생각해보는 습관을 가진다면 문장을 구성하는 실력이 향상될 것입니다.\n\n1~5형식을 함께 공부해봅시다!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2w3yj4cz': {
      'ko': '1형식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'yppfq8sm': {
      'ko': '주어(주인공) + 동사(동작)',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ynl1gqqa': {
      'ko':
          '나는 죽는다.\ni die.\n\n나는 운동장에 있다.\ni\'m in the playground.\n* in the playground는 부사이기에 문장성분에 포함되지 않음.\n\n나는 존재한다.\ni exist.\n\n그는 노래부른다.\nHe sings.\n\nThey dance.\n그들이 춤춘다.\n\nI swim in the river.\n나는 강에서 수영한다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'i1dcj8gc': {
      'ko':
          '* on, in, around 등을 \'전치사\'라고 해요.\n이미 필요한 문장성분이 끝났음에도, 추가적으로 더 넣고싶은 말이 있을때 사용하는 단어에요.\n그렇기에 문장 성분에 포함되지 않아요.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'nx9w21so': {
      'ko': '2형식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zqli7gob': {
      'ko': '주어 + 동사 + 주격보어',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '2lcbb11l': {
      'ko':
          '그녀는 행복해 보인다.\nShe looks happy.\n\n그는 피곤해 보인다.\nHe seems tired.\n\n그들은 자신있게 나타났다.\nThey appear confident.\n\n음식이 맛있는 냄새 난다.\nThe food smells delicious.\n\n하늘이 어둡게 변했다.\nThe sky turned dark.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'qoaspq5g': {
      'ko':
          '* 주격보어는 주어를 보충설명해주는 단어에요. \n주어를 보충설명해주는 단어가 꼭 필요한 동사들을 사용할때는 문장을 이렇게 구성하면 돼요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'twwcx7uz': {
      'ko': '3형식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '306vg65d': {
      'ko': '주어 + 동사 + 목적어',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'grms23hx': {
      'ko':
          '나는 사과를 먹었다. \nI ate an apple.\n\n그녀는 소설을 썼다. \nShe wrote a novel.\n\n우리는 빵을 구입했다. \nWe bought bread.\n\n그들은 집을 청소한다. \nThey clean the house.\n\n나는 영화를 본다. \nI watch a movie.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'vlx7qxd8': {
      'ko':
          '* 목적어는 동작의 목적이 되는 단어에요!\n\'먹다\' 의 경우, 뭘 먹었는지가 없으면 이야길가 성립될 수 없죠. 이런 단어를 \'목적어\' 라고 해요.\n* 목적어가 필요한 동사를 \'타동사\'라고 해요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'dlppg0s9': {
      'ko': '4형식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '6pdkkab8': {
      'ko': '주어 + 동사 + 간접 목적어 + 직접목적어',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'a6j3gv3n': {
      'ko':
          '나는 친구에게 선물을 줬다. \nI gave a present to my friend.\n\n그녀는 아이들에게 이야기를 해줬다. \nShe told a story to the kids.\n\n우리는 학생들에게 과제를 내려줬다. \nWe assigned homework to the students.\n\n그는 아내에게 꽃을 선물했다. \nHe gave flowers to his wife.\n\n나는 엄마에게 전화를 걸었다. \nI called my mom.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'yx1iqnhb': {
      'ko': '* \'보내다\' 같은 동사는, 누구에게 무엇을 보내는지 필요하죠. 이런 종류의 동사를 \'수여동사\'라고 해요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jsis56rg': {
      'ko': '5형식',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    't3neg6n4': {
      'ko': '주어 + 동사 + 목적어 + 목적격보어',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'bc1k5tjc': {
      'ko':
          '그녀는 그 책을 지루하다고 생각했다.\nShe thought the book was boring.\n\n나는 그 문제를 어렵다고 느꼈다. \nI felt the problem was difficult.\n\n우리는 그 노래를 아름답다고 생각한다.\n We think the song is beautiful.\n\n그들은 그 계획을 위험하다고 판단했다. \nThey judged the plan as risky.\n\n나는 그것을 불가능하다고 생각하지 않는다.\nI don\'t think it is impossible.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ocevnkbm': {
      'ko':
          '* \'생각하다\' 같은 경우, \'무엇을\' \'어떻게\' 생각하는지가 있어야겠죠? 가령, \"나는 철수를 잘생겼다고 생각한다.\"의 경우, (나, 철수, 잘생겼다) 의 세가지를 필요로 하네요.\n\n 이렇게 목적어에 대한 보충설명을 필요로 하는 동사를 5형식 동사라고 해요!',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // inputWord
  {
    'imhfb3sj': {
      'ko': '[단어를 영어로 적으세요.]',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // payment
  {
    'ss73sg4v': {
      'ko': '* 모든 컨텐츠를 사용하기 \n위해서는 결제가 필요합니다.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'xs6c9jrm': {
      'ko': '* 10000원 한번 결제로 평생 이용가능.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'vxe591ny': {
      'ko': '10000원',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    '2v6eglea': {
      'ko': 'Button',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ej3rwfdn': {
      'ko':
          'To take your photo this app requires permission to access the camera.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    '3p4yk0yz': {
      'ko':
          'To take alarm this app requires permission to access the Notification.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
    'vdbotw8n': {
      'ko':
          'To take your voice this app requires permission to access the microphone.',
      'en': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
