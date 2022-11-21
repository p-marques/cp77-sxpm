// Set XP Multiplier by pMarK
// v2.0

module SetXPMult.Menu
import SetXPMult.Base.SXPM

public class SXPMWithMenu extends SXPM {
    private let menuSettings: ref<SXPMMenu>;

    public func Setup() -> Void {
        this.menuSettings = new SXPMMenu();
        ModSettings.RegisterListenerToClass(this.menuSettings);
    }

    protected func GetMultiplier(type: gamedataProficiencyType) -> Float {
		switch type {
            case gamedataProficiencyType.Level: return this.menuSettings.LevelXPMultiplier;
            case gamedataProficiencyType.StreetCred: return this.menuSettings.StreetCredMultiplier;
			case gamedataProficiencyType.Assault: return this.menuSettings.AssaultXPMultiplier;
			case gamedataProficiencyType.Athletics: return this.menuSettings.AthleticsXPMultiplier;
			case gamedataProficiencyType.Brawling: return this.menuSettings.StreetBrawlerXPMultiplier;
			case gamedataProficiencyType.ColdBlood: return this.menuSettings.ColdBloodXPMultiplier;
			case gamedataProficiencyType.CombatHacking: return this.menuSettings.QuickhackingXPMultiplier;
			case gamedataProficiencyType.Crafting: return this.menuSettings.CraftingXPMultiplier;
			case gamedataProficiencyType.Demolition: return this.menuSettings.AnnihilationXPMultiplier;
			case gamedataProficiencyType.Engineering: return this.menuSettings.EngineeringXPMultiplier;
			case gamedataProficiencyType.Gunslinger: return this.menuSettings.HandgunsXPMultiplier;
			case gamedataProficiencyType.Hacking: return this.menuSettings.BreachProtocolXPMultiplier;
			case gamedataProficiencyType.Kenjutsu: return this.menuSettings.BladesXPMultiplier;
			case gamedataProficiencyType.Stealth: return this.menuSettings.NinjutsuXPMultiplier;

			default: return 1.0;
		}
	}

    public func GetIsEnabled() -> Bool {
        return this.menuSettings.IsEnabled;
    }
}

public class SXPMMenu {
    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Main")
    @runtimeProperty("ModSettings.displayName", "Enabled")
    @runtimeProperty("ModSettings.description", "Enable/Disable mod.")
    public let IsEnabled: Bool = true;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "General Multipliers")
    @runtimeProperty("ModSettings.displayName", "Level Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for character level experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let LevelXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "General Multipliers")
    @runtimeProperty("ModSettings.displayName", "Street Cred Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for street cred experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let StreetCredMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Assault Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Assault experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let AssaultXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Athletics Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Athletics experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let AthleticsXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Street Brawler Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Street Brawler experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let StreetBrawlerXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Cold Blood Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Cold Blood experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let ColdBloodXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Quickhacking Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Quickhacking experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let QuickhackingXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Crafting Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Crafting experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let CraftingXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Annihilation Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Annihilation experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let AnnihilationXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Engineering Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Engineering experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let EngineeringXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Handguns Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Handguns experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let HandgunsXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Breach Protocol Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Breach Protocol experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let BreachProtocolXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Blades Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Blades experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let BladesXPMultiplier: Float = 1.0;

    @runtimeProperty("ModSettings.mod", "Set XP Multiplier")
    @runtimeProperty("ModSettings.category", "Skill Multipliers")
    @runtimeProperty("ModSettings.displayName", "Ninjutsu Multiplier")
    @runtimeProperty("ModSettings.description", "Multiplier for Ninjutsu experience.")
    @runtimeProperty("ModSettings.step", "0.1")
    @runtimeProperty("ModSettings.min", "0.0")
    @runtimeProperty("ModSettings.max", "10.0")
    public let NinjutsuXPMultiplier: Float = 1.0;
}