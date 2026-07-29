import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure HeatExchangerBalance where
  hotFluidInletTemp : ℝ
  hotFluidOutletTemp : ℝ
  coldFluidInletTemp : ℝ
  coldFluidOutletTemp : ℝ
  hotFluidMassFlow : ℝ
  coldFluidMassFlow : ℝ
  hotFluidSpecificHeat : ℝ
  coldFluidSpecificHeat : ℝ
  heatTransferCoefficient : ℝ
  area : ℝ
  logMeanTempDiff : ℝ
  heatDuty : ℝ
  energyBalanceHot : heatDuty = hotFluidMassFlow * hotFluidSpecificHeat * (hotFluidInletTemp - hotFluidOutletTemp)
  energyBalanceCold : heatDuty = coldFluidMassFlow * coldFluidSpecificHeat * (coldFluidOutletTemp - coldFluidInletTemp)
  rateEquation : heatDuty = heatTransferCoefficient * area * logMeanTempDiff

structure HeatExchangerBalanceEvidence (H : HeatExchangerBalance) where
  hotEnergyClosed : H.energyBalanceHot
  coldEnergyClosed : H.energyBalanceCold
  rateClosed : H.rateEquation

def HeatExchangerBalanceClosed (H : HeatExchangerBalance) : Prop :=
  H.energyBalanceHot ∧ H.energyBalanceCold ∧ H.rateEquation

theorem heat_exchanger_balance_closed_from_evidence (H : HeatExchangerBalance) (E : HeatExchangerBalanceEvidence H) : HeatExchangerBalanceClosed H := by
  exact And.intro E.hotEnergyClosed (And.intro E.coldEnergyClosed E.rateClosed)

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse