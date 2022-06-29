import 'dart:collection';

import 'package:toplife/main_systems/system_school/degree_table_manager/degree_branch.dart';

enum DegreeDisciplines {
  socialScience(branches: {
    DegreeBranch.politicalScience,
    DegreeBranch.law,
    DegreeBranch.sociology,
    DegreeBranch.psychology,
    DegreeBranch.criminalJustice,
  }),
  naturalScience(branches: {
    DegreeBranch.biology,
    DegreeBranch.chemistry,
    DegreeBranch.physics,
    DegreeBranch.astronomy,
    DegreeBranch.mathematics,
  }),
  engineering(branches: {
    DegreeBranch.computerScience,
    DegreeBranch.electricalEngineering,
    DegreeBranch.mechanicalEngineering,
    DegreeBranch.chemicalEngineering,
  }),
  humanities(branches: {
    DegreeBranch.art,
    DegreeBranch.philosophy,
    DegreeBranch.languages,
    DegreeBranch.history,
    DegreeBranch.english,
  }),
  business(branches: {
    DegreeBranch.economics,
    DegreeBranch.marketing,
    DegreeBranch.accounting,
    DegreeBranch.finance,
    DegreeBranch.advertising,
  }),
  medical(branches: {
    DegreeBranch.surgery,
    DegreeBranch.pathology,
    DegreeBranch.pediatrics,
    DegreeBranch.neurology,
  }),
  nursing(branches: {
    DegreeBranch.nursing,
  }),
  pharmacy(branches: {
    DegreeBranch.pharmacy,
  }),
  law(branches: {
    DegreeBranch.criminalLaw,
    DegreeBranch.corporateLaw,
    DegreeBranch.realEstateLaw,
    DegreeBranch.familyLaw,
  }),
  education(branches: {
    DegreeBranch.biology,
    DegreeBranch.chemistry,
    DegreeBranch.physics,
    DegreeBranch.mathematics,
    DegreeBranch.art,
    DegreeBranch.philosophy,
    DegreeBranch.languages,
    DegreeBranch.history,
    DegreeBranch.english,
  });

  const DegreeDisciplines({required this.branches});

  final Set<String> branches;
}
