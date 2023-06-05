import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/person/current_person_usecase.dart';
import 'package:toplife/core/common_states/watch/relationship/specific_relationships/current_partner_relationship_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final currentPartnerRelationshipPairProvider = FutureProvider.family
    .autoDispose<RelationshipPair<Partner>?, int>(
        (ref, relationshipPersonID) async {
  final Person? person =
      await ref.watch(currentPersonProvider(relationshipPersonID).future);

  final Partner? partner = await ref
      .watch(currentPartnerRelationshipProvider(relationshipPersonID).future);

  if (person != null && partner != null) {
    return RelationshipPair<Partner>(
      relationship: partner,
      person: person,
      informalRelationshipType: InformalRelationshipType.partner,
    );
  }

  return null;
});
