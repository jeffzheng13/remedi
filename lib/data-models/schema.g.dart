// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class User extends _User with RealmEntity, RealmObjectBase, RealmObject {
  User(
    String name,
    String email,
    String password, {
    Iterable<Procedure> history = const [],
  }) {
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set<RealmList<Procedure>>(
        this, 'history', RealmList<Procedure>(history));
  }

  User._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String get password =>
      RealmObjectBase.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObjectBase.set(this, 'password', value);

  @override
  RealmList<Procedure> get history =>
      RealmObjectBase.get<Procedure>(this, 'history') as RealmList<Procedure>;
  @override
  set history(covariant RealmList<Procedure> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<User>> get changes =>
      RealmObjectBase.getChanges<User>(this);

  @override
  User freeze() => RealmObjectBase.freezeObject<User>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(User._);
    return const SchemaObject(ObjectType.realmObject, User, 'User', [
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('password', RealmPropertyType.string),
      SchemaProperty('history', RealmPropertyType.object,
          linkTarget: 'Procedure', collectionType: RealmCollectionType.list),
    ]);
  }
}

class Procedure extends _Procedure
    with RealmEntity, RealmObjectBase, RealmObject {
  Procedure({
    Iterable<Appointment> appointments = const [],
    Iterable<ActionItem> actionItems = const [],
    Iterable<Question> faqs = const [],
  }) {
    RealmObjectBase.set<RealmList<Appointment>>(
        this, 'appointments', RealmList<Appointment>(appointments));
    RealmObjectBase.set<RealmList<ActionItem>>(
        this, 'actionItems', RealmList<ActionItem>(actionItems));
    RealmObjectBase.set<RealmList<Question>>(
        this, 'faqs', RealmList<Question>(faqs));
  }

  Procedure._();

  @override
  RealmList<Appointment> get appointments =>
      RealmObjectBase.get<Appointment>(this, 'appointments')
          as RealmList<Appointment>;
  @override
  set appointments(covariant RealmList<Appointment> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<ActionItem> get actionItems =>
      RealmObjectBase.get<ActionItem>(this, 'actionItems')
          as RealmList<ActionItem>;
  @override
  set actionItems(covariant RealmList<ActionItem> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<Question> get faqs =>
      RealmObjectBase.get<Question>(this, 'faqs') as RealmList<Question>;
  @override
  set faqs(covariant RealmList<Question> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Procedure>> get changes =>
      RealmObjectBase.getChanges<Procedure>(this);

  @override
  Procedure freeze() => RealmObjectBase.freezeObject<Procedure>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Procedure._);
    return const SchemaObject(ObjectType.realmObject, Procedure, 'Procedure', [
      SchemaProperty('appointments', RealmPropertyType.object,
          linkTarget: 'Appointment', collectionType: RealmCollectionType.list),
      SchemaProperty('actionItems', RealmPropertyType.object,
          linkTarget: 'ActionItem', collectionType: RealmCollectionType.list),
      SchemaProperty('faqs', RealmPropertyType.object,
          linkTarget: 'Question', collectionType: RealmCollectionType.list),
    ]);
  }
}

class Appointment extends _Appointment
    with RealmEntity, RealmObjectBase, RealmObject {
  Appointment(
    DateTime time,
    String name,
    String description,
  ) {
    RealmObjectBase.set(this, 'time', time);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'description', description);
  }

  Appointment._();

  @override
  DateTime get time => RealmObjectBase.get<DateTime>(this, 'time') as DateTime;
  @override
  set time(DateTime value) => RealmObjectBase.set(this, 'time', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  Stream<RealmObjectChanges<Appointment>> get changes =>
      RealmObjectBase.getChanges<Appointment>(this);

  @override
  Appointment freeze() => RealmObjectBase.freezeObject<Appointment>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Appointment._);
    return const SchemaObject(
        ObjectType.realmObject, Appointment, 'Appointment', [
      SchemaProperty('time', RealmPropertyType.timestamp),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
    ]);
  }
}

class ActionItem extends _ActionItem
    with RealmEntity, RealmObjectBase, RealmObject {
  ActionItem(
    String task,
    int timesPerDay,
    int daysBetweenAction,
  ) {
    RealmObjectBase.set(this, 'task', task);
    RealmObjectBase.set(this, 'timesPerDay', timesPerDay);
    RealmObjectBase.set(this, 'daysBetweenAction', daysBetweenAction);
  }

  ActionItem._();

  @override
  String get task => RealmObjectBase.get<String>(this, 'task') as String;
  @override
  set task(String value) => RealmObjectBase.set(this, 'task', value);

  @override
  int get timesPerDay => RealmObjectBase.get<int>(this, 'timesPerDay') as int;
  @override
  set timesPerDay(int value) => RealmObjectBase.set(this, 'timesPerDay', value);

  @override
  int get daysBetweenAction =>
      RealmObjectBase.get<int>(this, 'daysBetweenAction') as int;
  @override
  set daysBetweenAction(int value) =>
      RealmObjectBase.set(this, 'daysBetweenAction', value);

  @override
  Stream<RealmObjectChanges<ActionItem>> get changes =>
      RealmObjectBase.getChanges<ActionItem>(this);

  @override
  ActionItem freeze() => RealmObjectBase.freezeObject<ActionItem>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ActionItem._);
    return const SchemaObject(
        ObjectType.realmObject, ActionItem, 'ActionItem', [
      SchemaProperty('task', RealmPropertyType.string),
      SchemaProperty('timesPerDay', RealmPropertyType.int),
      SchemaProperty('daysBetweenAction', RealmPropertyType.int),
    ]);
  }
}

class Question extends _Question
    with RealmEntity, RealmObjectBase, RealmObject {
  Question(
    String question,
    String answer,
  ) {
    RealmObjectBase.set(this, 'question', question);
    RealmObjectBase.set(this, 'answer', answer);
  }

  Question._();

  @override
  String get question =>
      RealmObjectBase.get<String>(this, 'question') as String;
  @override
  set question(String value) => RealmObjectBase.set(this, 'question', value);

  @override
  String get answer => RealmObjectBase.get<String>(this, 'answer') as String;
  @override
  set answer(String value) => RealmObjectBase.set(this, 'answer', value);

  @override
  Stream<RealmObjectChanges<Question>> get changes =>
      RealmObjectBase.getChanges<Question>(this);

  @override
  Question freeze() => RealmObjectBase.freezeObject<Question>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Question._);
    return const SchemaObject(ObjectType.realmObject, Question, 'Question', [
      SchemaProperty('question', RealmPropertyType.string),
      SchemaProperty('answer', RealmPropertyType.string),
    ]);
  }
}
