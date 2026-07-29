import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure ReactionKineticsPackage where
  rateConstant : Type u
  activationEnergy : Type v
  temperatureDependence : Prop
  rateLaw : Prop
  equilibriumConstant : Prop

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  temperatureDependenceClosed : R.temperatureDependence
  rateLawClosed : R.rateLaw
  equilibriumConstantClosed : R.equilibriumConstant

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.temperatureDependence ∧ R.rateLaw ∧ R.equilibriumConstant

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsPackage)
    (E : ReactionKineticsEvidence R) : ReactionKineticsClosed R := by
  exact And.intro E.temperatureDependenceClosed (And.intro E.rateLawClosed E.equilibriumConstantClosed)

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse