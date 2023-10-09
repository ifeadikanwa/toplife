import 'package:toplife/main_systems/system_relationship/data/repository/acquaintance_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/child_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/friend_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/grave_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/inlaw_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/parent_child_link_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/parent_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/partner_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relationship_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/relative_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/romantic_relationship_info_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/data/repository/sibling_repository_impl.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/acquaintance_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/child_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/friend_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/grave_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/inlaw_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/parent_child_link_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/parent_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/partner_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/relationship_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/relative_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/romantic_relationship_info_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/sibling_dao.dart';

class RelationshipRepositories {
  final ParentChildLinkDao _parentChildLinkDao;
  final RelationshipDao _relationshipDao;
  final RomanticRelationshipInfoDao _romanticRelationshipInfoDao;
  final ParentDao _parentDao;
  final ChildDao _childDao;
  final SiblingDao _siblingDao;
  final PartnerDao _partnerDao;
  final FriendDao _friendDao;
  final AcquaintanceDao _acquaintanceDao;
  final RelativeDao _relativeDao;
  final InLawDao _inLawDao;
  final GraveDao _graveDao;

  const RelationshipRepositories({
    required ParentChildLinkDao parentChildLinkDao,
    required RelationshipDao relationshipDao,
    required RomanticRelationshipInfoDao romanticRelationshipInfoDao,
    required ParentDao parentDao,
    required ChildDao childDao,
    required SiblingDao siblingDao,
    required PartnerDao partnerDao,
    required FriendDao friendDao,
    required AcquaintanceDao acquaintanceDao,
    required RelativeDao relativeDao,
    required InLawDao inLawDao,
    required GraveDao graveDao,
  })  : _parentChildLinkDao = parentChildLinkDao,
        _relationshipDao = relationshipDao,
        _romanticRelationshipInfoDao = romanticRelationshipInfoDao,
        _parentDao = parentDao,
        _childDao = childDao,
        _siblingDao = siblingDao,
        _partnerDao = partnerDao,
        _friendDao = friendDao,
        _acquaintanceDao = acquaintanceDao,
        _relativeDao = relativeDao,
        _inLawDao = inLawDao,
        _graveDao = graveDao;

  ParentChildLinkRepositoryImpl get parentChildLinkRepositoryImpl =>
      ParentChildLinkRepositoryImpl(parentChildLinkDao: _parentChildLinkDao);

  RelationshipRepositoryImpl get relationshipRepositoryImpl =>
      RelationshipRepositoryImpl(relationshipDao: _relationshipDao);

  RomanticRelationshipInfoRepositoryImpl
      get romanticRelationshipInfoRepositoryImpl =>
          RomanticRelationshipInfoRepositoryImpl(
              romanticRelationshipInfoDao: _romanticRelationshipInfoDao);

  ParentRepositoryImpl get parentRepositoryImpl =>
      ParentRepositoryImpl(parentDao: _parentDao);

  ChildRepositoryImpl get childRepositoryImpl =>
      ChildRepositoryImpl(childDao: _childDao);

  SiblingRepositoryImpl get siblingRepositoryImpl =>
      SiblingRepositoryImpl(siblingDao: _siblingDao);

  PartnerRepositoryImpl get partnerRepositoryImpl =>
      PartnerRepositoryImpl(partnerDao: _partnerDao);

  FriendRepositoryImpl get friendRepositoryImpl =>
      FriendRepositoryImpl(friendDao: _friendDao);

  AcquaintanceRepositoryImpl get acquaintanceRepositoryImpl =>
      AcquaintanceRepositoryImpl(acquaintanceDao: _acquaintanceDao);

  RelativeRepositoryImpl get relativeRepositoryImpl =>
      RelativeRepositoryImpl(relativeDao: _relativeDao);

  InLawRepositoryImpl get inLawRepositoryImpl =>
      InLawRepositoryImpl(inLawDao: _inLawDao);

  GraveRepositoryImpl get graveRepositoryImpl =>
      GraveRepositoryImpl(graveDao: _graveDao);
}
