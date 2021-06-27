defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params ate valid, returns the a valid changeset" do
      params = %{name: "Lucas", email: "lucas@example.com", password: "12344321"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "lucas@example.com", name: "Lucas", password: "12344321"},
               errors: []
             } = response
    end

    test "when there are invalid params, returns the a invalid changeset" do
      params = %{name: "L", email: "lucas@example.com"}

      response = User.changeset(params)

      expected_response = %{
        name: ["should be at least 2 character(s)"],
        password: ["can't be blank"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
