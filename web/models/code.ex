defmodule CodeCasket.Code do
  use CodeCasket.Web, :model

  @adjectives ~w{
    agony akasha alabaster albion amarantha anarchy anathema angel angst
    apollyon aradia arcane ash ashe astaroth autumn azazel baleful bane baphomet
    bat beast belladonna black blade blaise blaze blood bourne briar burgundy
    calamity carmilla carmine carnal chalice chaos charnel chylde cinder claw
    cobra crescent crimson crow crypt crystal daemon dagger dagon damien dante
    dark death december dementia desire despair devil dire doom draco dragon
    dream dusk dust ebony echo eclipse eldritch elegia entropy eternity ethereal
    evening fallen fang fangs fatal february fenriz feral frost fuchsia gabriel
    garnet gash gloom gothyc grae hades hecate hellfire howl illusion infernal
    inferno iron ishtar ivory jacynth jaded january jezabel kindred knife la
    lamia lavender leather lestat lilith loki lucian lucifer lucretia lunar lust
    magenta malaise malice mauve mayhem metal midnight midwinter moon moor
    mordred morgana mourning myst mystery naamah nephthys night nightshade
    november obsidian ocean october onyx opal ophelia pallor pentacle pentagram
    persephone phantasm phantom poison purple python ragnar rain raven rosamunde
    ruby sable sabre samhain sammael sanguine satanyc scarlet scorn scorpion
    scream secret september serenity serpent shade shadow sigh silence silent
    silver sin skye smoke snake snow solitary sorrow soul soulstice spawn spider
    star steel storm suspiria sword szandor tanith tempest theda thorn thunder
    twilight ulalume vampyre velvet venom vervain vey vine viper vlad whispyr
    wild willow wind wine wings winter wolf wraith wysp
  }

  schema "codes" do
    field :title, :string
    field :body, :string
    field :slug, :string

    timestamps
  end

  @required_fields ~w(title body)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> generate_slug
  end

  def generate_slug(model) do
    slug = @adjectives |> Enum.take_random(4) |> Enum.join("-")
    change(model, slug: slug)
  end
end
