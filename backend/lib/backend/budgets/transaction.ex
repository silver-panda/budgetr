defmodule Backend.Budgets.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :amount, :integer
    field :category, :string
    field :datetime_occurred, :utc_datetime
    field :description, :string
    belongs_to :user, Backend.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:datetime_occurred, :amount, :description, :category, :user_id])
    |> foreign_key_constraint(:user_id)
    |> validate_required([:datetime_occurred, :amount, :description, :category])
  end
end
