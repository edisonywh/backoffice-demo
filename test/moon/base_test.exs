defmodule Moon.BaseTest do
  use Moon.DataCase

  alias Moon.Base

  describe "spaceships" do
    alias Moon.Base.Spaceship

    @valid_attrs %{capacity: 42, name: "some name"}
    @update_attrs %{capacity: 43, name: "some updated name"}
    @invalid_attrs %{capacity: nil, name: nil}

    def spaceship_fixture(attrs \\ %{}) do
      {:ok, spaceship} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Base.create_spaceship()

      spaceship
    end

    test "list_spaceships/0 returns all spaceships" do
      spaceship = spaceship_fixture()
      assert Base.list_spaceships() == [spaceship]
    end

    test "get_spaceship!/1 returns the spaceship with given id" do
      spaceship = spaceship_fixture()
      assert Base.get_spaceship!(spaceship.id) == spaceship
    end

    test "create_spaceship/1 with valid data creates a spaceship" do
      assert {:ok, %Spaceship{} = spaceship} = Base.create_spaceship(@valid_attrs)
      assert spaceship.capacity == 42
      assert spaceship.name == "some name"
    end

    test "create_spaceship/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Base.create_spaceship(@invalid_attrs)
    end

    test "update_spaceship/2 with valid data updates the spaceship" do
      spaceship = spaceship_fixture()
      assert {:ok, %Spaceship{} = spaceship} = Base.update_spaceship(spaceship, @update_attrs)
      assert spaceship.capacity == 43
      assert spaceship.name == "some updated name"
    end

    test "update_spaceship/2 with invalid data returns error changeset" do
      spaceship = spaceship_fixture()
      assert {:error, %Ecto.Changeset{}} = Base.update_spaceship(spaceship, @invalid_attrs)
      assert spaceship == Base.get_spaceship!(spaceship.id)
    end

    test "delete_spaceship/1 deletes the spaceship" do
      spaceship = spaceship_fixture()
      assert {:ok, %Spaceship{}} = Base.delete_spaceship(spaceship)
      assert_raise Ecto.NoResultsError, fn -> Base.get_spaceship!(spaceship.id) end
    end

    test "change_spaceship/1 returns a spaceship changeset" do
      spaceship = spaceship_fixture()
      assert %Ecto.Changeset{} = Base.change_spaceship(spaceship)
    end
  end

  describe "users" do
    alias Moon.Base.User

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Base.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Base.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Base.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Base.create_user(@valid_attrs)
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Base.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Base.update_user(user, @update_attrs)
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Base.update_user(user, @invalid_attrs)
      assert user == Base.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Base.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Base.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Base.change_user(user)
    end
  end

  describe "rides" do
    alias Moon.Base.Ride

    @valid_attrs %{codename: "some codename", scheduled_at: "2010-04-17T14:00:00Z", status: "some status"}
    @update_attrs %{codename: "some updated codename", scheduled_at: "2011-05-18T15:01:01Z", status: "some updated status"}
    @invalid_attrs %{codename: nil, scheduled_at: nil, status: nil}

    def ride_fixture(attrs \\ %{}) do
      {:ok, ride} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Base.create_ride()

      ride
    end

    test "list_rides/0 returns all rides" do
      ride = ride_fixture()
      assert Base.list_rides() == [ride]
    end

    test "get_ride!/1 returns the ride with given id" do
      ride = ride_fixture()
      assert Base.get_ride!(ride.id) == ride
    end

    test "create_ride/1 with valid data creates a ride" do
      assert {:ok, %Ride{} = ride} = Base.create_ride(@valid_attrs)
      assert ride.codename == "some codename"
      assert ride.scheduled_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert ride.status == "some status"
    end

    test "create_ride/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Base.create_ride(@invalid_attrs)
    end

    test "update_ride/2 with valid data updates the ride" do
      ride = ride_fixture()
      assert {:ok, %Ride{} = ride} = Base.update_ride(ride, @update_attrs)
      assert ride.codename == "some updated codename"
      assert ride.scheduled_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert ride.status == "some updated status"
    end

    test "update_ride/2 with invalid data returns error changeset" do
      ride = ride_fixture()
      assert {:error, %Ecto.Changeset{}} = Base.update_ride(ride, @invalid_attrs)
      assert ride == Base.get_ride!(ride.id)
    end

    test "delete_ride/1 deletes the ride" do
      ride = ride_fixture()
      assert {:ok, %Ride{}} = Base.delete_ride(ride)
      assert_raise Ecto.NoResultsError, fn -> Base.get_ride!(ride.id) end
    end

    test "change_ride/1 returns a ride changeset" do
      ride = ride_fixture()
      assert %Ecto.Changeset{} = Base.change_ride(ride)
    end
  end

  describe "journeys" do
    alias Moon.Base.Journey

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def journey_fixture(attrs \\ %{}) do
      {:ok, journey} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Base.create_journey()

      journey
    end

    test "list_journeys/0 returns all journeys" do
      journey = journey_fixture()
      assert Base.list_journeys() == [journey]
    end

    test "get_journey!/1 returns the journey with given id" do
      journey = journey_fixture()
      assert Base.get_journey!(journey.id) == journey
    end

    test "create_journey/1 with valid data creates a journey" do
      assert {:ok, %Journey{} = journey} = Base.create_journey(@valid_attrs)
    end

    test "create_journey/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Base.create_journey(@invalid_attrs)
    end

    test "update_journey/2 with valid data updates the journey" do
      journey = journey_fixture()
      assert {:ok, %Journey{} = journey} = Base.update_journey(journey, @update_attrs)
    end

    test "update_journey/2 with invalid data returns error changeset" do
      journey = journey_fixture()
      assert {:error, %Ecto.Changeset{}} = Base.update_journey(journey, @invalid_attrs)
      assert journey == Base.get_journey!(journey.id)
    end

    test "delete_journey/1 deletes the journey" do
      journey = journey_fixture()
      assert {:ok, %Journey{}} = Base.delete_journey(journey)
      assert_raise Ecto.NoResultsError, fn -> Base.get_journey!(journey.id) end
    end

    test "change_journey/1 returns a journey changeset" do
      journey = journey_fixture()
      assert %Ecto.Changeset{} = Base.change_journey(journey)
    end
  end

  describe "manufacturers" do
    alias Moon.Base.Manufacturer

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def manufacturer_fixture(attrs \\ %{}) do
      {:ok, manufacturer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Base.create_manufacturer()

      manufacturer
    end

    test "list_manufacturers/0 returns all manufacturers" do
      manufacturer = manufacturer_fixture()
      assert Base.list_manufacturers() == [manufacturer]
    end

    test "get_manufacturer!/1 returns the manufacturer with given id" do
      manufacturer = manufacturer_fixture()
      assert Base.get_manufacturer!(manufacturer.id) == manufacturer
    end

    test "create_manufacturer/1 with valid data creates a manufacturer" do
      assert {:ok, %Manufacturer{} = manufacturer} = Base.create_manufacturer(@valid_attrs)
      assert manufacturer.name == "some name"
    end

    test "create_manufacturer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Base.create_manufacturer(@invalid_attrs)
    end

    test "update_manufacturer/2 with valid data updates the manufacturer" do
      manufacturer = manufacturer_fixture()
      assert {:ok, %Manufacturer{} = manufacturer} = Base.update_manufacturer(manufacturer, @update_attrs)
      assert manufacturer.name == "some updated name"
    end

    test "update_manufacturer/2 with invalid data returns error changeset" do
      manufacturer = manufacturer_fixture()
      assert {:error, %Ecto.Changeset{}} = Base.update_manufacturer(manufacturer, @invalid_attrs)
      assert manufacturer == Base.get_manufacturer!(manufacturer.id)
    end

    test "delete_manufacturer/1 deletes the manufacturer" do
      manufacturer = manufacturer_fixture()
      assert {:ok, %Manufacturer{}} = Base.delete_manufacturer(manufacturer)
      assert_raise Ecto.NoResultsError, fn -> Base.get_manufacturer!(manufacturer.id) end
    end

    test "change_manufacturer/1 returns a manufacturer changeset" do
      manufacturer = manufacturer_fixture()
      assert %Ecto.Changeset{} = Base.change_manufacturer(manufacturer)
    end
  end
end
