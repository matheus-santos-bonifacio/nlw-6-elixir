defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exist, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)
      expected_response = {:ok, %{"Laura" => 22.1606648199446, "Matheus" => 21.604938271604937}}

      assert response == expected_response
    end

    test "when the wrong filename si given, returns an error" do
      params = %{"filename" => "fake_file.csv"}

      response = IMC.calculate(params)
      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
