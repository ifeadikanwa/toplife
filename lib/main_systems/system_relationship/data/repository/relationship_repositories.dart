import 'package:toplife/main_systems/system_relationship/data/repository/grave_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/parent_child_link_repository_impl.dart';

import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repository_impl.dart';

import 'package:toplife/main_systems/system_relationship/domain/dao/grave_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/parent_child_link_dao.dart';

import 'package:toplife/main_systems/system_relationship/domain/dao/relationship_dao.dart';

class RelationshipRepositories {
  final ParentChildLinkDao _parentChildLinkDao;
  final RelationshipDao _relationshipDao;
  final GraveDao _graveDao;

  const RelationshipRepositories({
    required ParentChildLinkDao parentChildLinkDao,
    required RelationshipDao relationshipDao,
    required GraveDao graveDao,
  })  : _parentChildLinkDao = parentChildLinkDao,
        _relationshipDao = relationshipDao,
        _graveDao = graveDao;

  ParentChildLinkRepositoryImpl get parentChildLinkRepositoryImpl =>
      ParentChildLinkRepositoryImpl(parentChildLinkDao: _parentChildLinkDao);

  RelationshipRepositoryImpl get relationshipRepositoryImpl =>
      RelationshipRepositoryImpl(relationshipDao: _relationshipDao);

  GraveRepositoryImpl get graveRepositoryImpl =>
      GraveRepositoryImpl(graveDao: _graveDao);
}
