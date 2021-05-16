# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Moon.Repo.insert!(%Moon.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Moon.Repo
alias Moon.Base.{Manufacturer, User, Journey, Ride, Spaceship}

manufacturers =
  [
    %Manufacturer{
      name: "SpaceX"
    },
    %Manufacturer{
      name: "Boeing"
    },
    %Manufacturer{
      name: "Lockheed Martin"
    },
    %Manufacturer{
      name: "Blue Origin"
    },
    %Manufacturer{
      name: "Virgin Galactic"
    }
  ]
  |> Enum.map(fn m -> Repo.insert!(m) end)

users =
  Enum.map(1..50, fn _ ->
    %User{name: Faker.Pokemon.name()}
    |> Repo.insert!()
  end)

spaceships =
  Enum.map(1..50, fn _ ->
    name = "#{Faker.StarWars.planet()} #{Faker.Vehicle.make_and_model()}"

    %Spaceship{name: name, manufacturer_id: Enum.random(manufacturers).id}
    |> Repo.insert!()
  end)

today = Date.utc_today()
ago = Date.add(today, -42)
future = Date.add(today, 42)
datetime = Date.range(ago, future)

date_to_datetime = fn date ->
  "#{date} 00:00:00Z" |> DateTime.from_iso8601() |> elem(1)
end

rides =
  Enum.map(1..50, fn _ ->
    %Ride{
      codename: Faker.StarWars.planet(),
      status: :scheduled,
      scheduled_at: Enum.random(datetime) |> date_to_datetime.(),
      spaceship_id: Enum.random(spaceships).id
    }
    |> Repo.insert!()
  end)

journeys =
  Enum.map(1..100, fn _ ->
    %Journey{
      ride_id: Enum.random(rides).id,
      user_id: Enum.random(users).id
    }
    |> Repo.insert!()
  end)
