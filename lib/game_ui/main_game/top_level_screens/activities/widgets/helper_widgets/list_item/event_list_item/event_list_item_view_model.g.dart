// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_list_item_view_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EventListItemViewModelDataCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// EventListItemViewModelData(...).copyWith(id: 12, name: "My name")
  /// ````
  EventListItemViewModelData call({
    String? eventTitle,
    String? eventLocation,
    String? eventTime,
    bool? listItemIsDisabled,
    bool? attendButtonIsEnabled,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEventListItemViewModelData.copyWith(...)`.
class _$EventListItemViewModelDataCWProxyImpl
    implements _$EventListItemViewModelDataCWProxy {
  const _$EventListItemViewModelDataCWProxyImpl(this._value);

  final EventListItemViewModelData _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// EventListItemViewModelData(...).copyWith(id: 12, name: "My name")
  /// ````
  EventListItemViewModelData call({
    Object? eventTitle = const $CopyWithPlaceholder(),
    Object? eventLocation = const $CopyWithPlaceholder(),
    Object? eventTime = const $CopyWithPlaceholder(),
    Object? listItemIsDisabled = const $CopyWithPlaceholder(),
    Object? attendButtonIsEnabled = const $CopyWithPlaceholder(),
  }) {
    return EventListItemViewModelData(
      eventTitle:
          eventTitle == const $CopyWithPlaceholder() || eventTitle == null
              ? _value.eventTitle
              // ignore: cast_nullable_to_non_nullable
              : eventTitle as String,
      eventLocation:
          eventLocation == const $CopyWithPlaceholder() || eventLocation == null
              ? _value.eventLocation
              // ignore: cast_nullable_to_non_nullable
              : eventLocation as String,
      eventTime: eventTime == const $CopyWithPlaceholder() || eventTime == null
          ? _value.eventTime
          // ignore: cast_nullable_to_non_nullable
          : eventTime as String,
      listItemIsDisabled: listItemIsDisabled == const $CopyWithPlaceholder() ||
              listItemIsDisabled == null
          ? _value.listItemIsDisabled
          // ignore: cast_nullable_to_non_nullable
          : listItemIsDisabled as bool,
      attendButtonIsEnabled:
          attendButtonIsEnabled == const $CopyWithPlaceholder() ||
                  attendButtonIsEnabled == null
              ? _value.attendButtonIsEnabled
              // ignore: cast_nullable_to_non_nullable
              : attendButtonIsEnabled as bool,
    );
  }
}

extension $EventListItemViewModelDataCopyWith on EventListItemViewModelData {
  /// Returns a callable class that can be used as follows: `instanceOfEventListItemViewModelData.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$EventListItemViewModelDataCWProxy get copyWith =>
      _$EventListItemViewModelDataCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventListItemViewModelHash() =>
    r'c14e741d720df610afaae81074e225b11b55b62b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$EventListItemViewModel
    extends BuildlessAutoDisposeAsyncNotifier<EventListItemViewModelData> {
  late final EventItem eventItem;

  FutureOr<EventListItemViewModelData> build({
    required EventItem eventItem,
  });
}

/// See also [EventListItemViewModel].
@ProviderFor(EventListItemViewModel)
const eventListItemViewModelProvider = EventListItemViewModelFamily();

/// See also [EventListItemViewModel].
class EventListItemViewModelFamily
    extends Family<AsyncValue<EventListItemViewModelData>> {
  /// See also [EventListItemViewModel].
  const EventListItemViewModelFamily();

  /// See also [EventListItemViewModel].
  EventListItemViewModelProvider call({
    required EventItem eventItem,
  }) {
    return EventListItemViewModelProvider(
      eventItem: eventItem,
    );
  }

  @override
  EventListItemViewModelProvider getProviderOverride(
    covariant EventListItemViewModelProvider provider,
  ) {
    return call(
      eventItem: provider.eventItem,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'eventListItemViewModelProvider';
}

/// See also [EventListItemViewModel].
class EventListItemViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<EventListItemViewModel,
        EventListItemViewModelData> {
  /// See also [EventListItemViewModel].
  EventListItemViewModelProvider({
    required EventItem eventItem,
  }) : this._internal(
          () => EventListItemViewModel()..eventItem = eventItem,
          from: eventListItemViewModelProvider,
          name: r'eventListItemViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventListItemViewModelHash,
          dependencies: EventListItemViewModelFamily._dependencies,
          allTransitiveDependencies:
              EventListItemViewModelFamily._allTransitiveDependencies,
          eventItem: eventItem,
        );

  EventListItemViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventItem,
  }) : super.internal();

  final EventItem eventItem;

  @override
  FutureOr<EventListItemViewModelData> runNotifierBuild(
    covariant EventListItemViewModel notifier,
  ) {
    return notifier.build(
      eventItem: eventItem,
    );
  }

  @override
  Override overrideWith(EventListItemViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: EventListItemViewModelProvider._internal(
        () => create()..eventItem = eventItem,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventItem: eventItem,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<EventListItemViewModel,
      EventListItemViewModelData> createElement() {
    return _EventListItemViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EventListItemViewModelProvider &&
        other.eventItem == eventItem;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventItem.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EventListItemViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<EventListItemViewModelData> {
  /// The parameter `eventItem` of this provider.
  EventItem get eventItem;
}

class _EventListItemViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<EventListItemViewModel,
        EventListItemViewModelData> with EventListItemViewModelRef {
  _EventListItemViewModelProviderElement(super.provider);

  @override
  EventItem get eventItem =>
      (origin as EventListItemViewModelProvider).eventItem;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
