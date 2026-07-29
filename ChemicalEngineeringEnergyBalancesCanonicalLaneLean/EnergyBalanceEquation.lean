import canonicalLaneMathlib.AdmissibleClass
import ChemicalEngineeringEnergyBalancesCanonicalLaneLean.ReactionKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure EnergyBalancePackage {R : ReactionKineticsPackage} where
  enthalpyBalance : Prop
  heatTransfer : Prop
  workTerms : Prop
  accumulationTerm : Prop

structure EnergyBalanceEvidence {R : ReactionKineticsPackage}
    (E : EnergyBalancePackage R) where
  enthalpyBalanceClosed : E.enthalpyBalance
  heatTransferClosed : E.heatTransfer
  workTermsClosed : E.workTerms
  accumulationTermClosed : E.accumulationTerm

def EnergyBalanceClosed {R : ReactionKineticsPackage} (E : EnergyBalancePackage R) : Prop :=
  E.enthalpyBalance ∧ E.heatTransfer ∧ E.workTerms ∧ E.accumulationTerm

theorem energy_balance_closed_from_evidence {R : ReactionKineticsPackage}
    (E : EnergyBalancePackage R) (Ev : EnergyBalanceEvidence E) : EnergyBalanceClosed E := by
  exact And.intro Ev.enthalpyBalanceClosed (And.intro Ev.heatTransferClosed
    (And.intro Ev.workTermsClosed Ev.accumulationTermClosed))

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse