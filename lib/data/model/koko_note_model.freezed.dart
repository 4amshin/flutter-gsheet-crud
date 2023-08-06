// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'koko_note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KokoNoteModel _$KokoNoteModelFromJson(Map<String, dynamic> json) {
  return _KokoNoteModel.fromJson(json);
}

/// @nodoc
mixin _$KokoNoteModel {
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KokoNoteModelCopyWith<KokoNoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KokoNoteModelCopyWith<$Res> {
  factory $KokoNoteModelCopyWith(
          KokoNoteModel value, $Res Function(KokoNoteModel) then) =
      _$KokoNoteModelCopyWithImpl<$Res, KokoNoteModel>;
  @useResult
  $Res call({int id, String text});
}

/// @nodoc
class _$KokoNoteModelCopyWithImpl<$Res, $Val extends KokoNoteModel>
    implements $KokoNoteModelCopyWith<$Res> {
  _$KokoNoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KokoNoteModelCopyWith<$Res>
    implements $KokoNoteModelCopyWith<$Res> {
  factory _$$_KokoNoteModelCopyWith(
          _$_KokoNoteModel value, $Res Function(_$_KokoNoteModel) then) =
      __$$_KokoNoteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String text});
}

/// @nodoc
class __$$_KokoNoteModelCopyWithImpl<$Res>
    extends _$KokoNoteModelCopyWithImpl<$Res, _$_KokoNoteModel>
    implements _$$_KokoNoteModelCopyWith<$Res> {
  __$$_KokoNoteModelCopyWithImpl(
      _$_KokoNoteModel _value, $Res Function(_$_KokoNoteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_$_KokoNoteModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KokoNoteModel implements _KokoNoteModel {
  const _$_KokoNoteModel({required this.id, required this.text});

  factory _$_KokoNoteModel.fromJson(Map<String, dynamic> json) =>
      _$$_KokoNoteModelFromJson(json);

  @override
  final int id;
  @override
  final String text;

  @override
  String toString() {
    return 'KokoNoteModel(id: $id, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KokoNoteModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KokoNoteModelCopyWith<_$_KokoNoteModel> get copyWith =>
      __$$_KokoNoteModelCopyWithImpl<_$_KokoNoteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KokoNoteModelToJson(
      this,
    );
  }
}

abstract class _KokoNoteModel implements KokoNoteModel {
  const factory _KokoNoteModel(
      {required final int id, required final String text}) = _$_KokoNoteModel;

  factory _KokoNoteModel.fromJson(Map<String, dynamic> json) =
      _$_KokoNoteModel.fromJson;

  @override
  int get id;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_KokoNoteModelCopyWith<_$_KokoNoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
