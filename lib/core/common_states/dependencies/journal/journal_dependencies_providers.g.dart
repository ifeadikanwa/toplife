// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_dependencies_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$journalRepositoryHash() => r'd018a5ae93766775165e859739276c6574b5ae55';

/// See also [journalRepository].
@ProviderFor(journalRepository)
final journalRepositoryProvider =
    AutoDisposeProvider<JournalRepositoryImpl>.internal(
  journalRepository,
  name: r'journalRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$journalRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef JournalRepositoryRef = AutoDisposeProviderRef<JournalRepositoryImpl>;
String _$journalUsecasesHash() => r'3cffd7a7d33a83112fac8a38c4b51b834aa1b321';

/// See also [journalUsecases].
@ProviderFor(journalUsecases)
final journalUsecasesProvider = AutoDisposeProvider<JournalUsecases>.internal(
  journalUsecases,
  name: r'journalUsecasesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$journalUsecasesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef JournalUsecasesRef = AutoDisposeProviderRef<JournalUsecases>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
