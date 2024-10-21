local simulations = {}

simulations.orbital_logistics =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "Spaceman"}
    player.teleport({-1.5, 2})
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    game.forces.player.worker_robots_speed_modifier = 2
    game.forces.player.worker_robots_storage_bonus = 9

    local technologies = prototypes.technology
    technology_list =
    {
      "planet-discovery-vulcanus","physical-projectile-damage-1","physical-projectile-damage-2","physical-projectile-damage-3",
      "physical-projectile-damage-4","physical-projectile-damage-5","physical-projectile-damage-6","physical-projectile-damage-7",
      "logistic-robotics","worker-robots-storage-1","worker-robots-storage-2","worker-robots-storage-3","space-platform-thruster"
    }
    for k, name in ipairs (technology_list) do
      game.forces.player.technologies[name].researched = true
    end

    game.forces.player.recipes["carbonic-asteroid-crushing"].enabled = true
    game.forces.player.recipes["metallic-asteroid-crushing"].enabled = true
    game.forces.player.recipes["oxide-asteroid-crushing"].enabled = true

    game.planets.vulcanus.create_surface()

    for x = -11, 10, 1 do
      for y = -5, 6 do
        game.surfaces[2].set_tiles{{position = {x, y}, name = "volcanic-ash-dark"}}
      end
    end

    for k, position in pairs ({{-8, 3}, {-7, 3},
                               {-10, 4}, {-9, 4}, {-8, 4}, {-7, 4}, {-6, 4},
                               {-10, 5}, {-9, 5}, {-8, 5}, {-7, 5},
                               {-11, 6}, {-10, 6}, {-9, 6}, {-8, 6}}) do
      game.surfaces[2].set_tiles{{position = position, name = "lava"}}
    end

    for k, position in pairs ({{-8, 2}, {-7, 2},
                               {-9, 3}, {-6, 3},
                               {-11, 4}, {-5, 4},
                               {-11, 5}, {-6, 5},
                               {-12, 6}, {-7, 6}}) do
      game.surfaces[2].set_tiles{{position = position, name = "volcanic-cracks-hot"}}
    end

    for k, position in pairs ({{-9, 2}, {0, 2}, {1, 2},
                               {-11, 3}, {-10, 3}, {-1, 3}, {0, 3}, {1, 3},
                               {-2, 4}, {-1, 4}, {0, 4}, {1, 4}, {2, 4}, {3, 4},
                               {-5, 5}, {-4, 5}, {-3, 5}, {-2, 5}, {-1, 5}, {0, 5}, {1, 5}, {2, 5}, {3, 5},
                               {-6, 6}, {-5, 6}, {-4, 6}, {-3, 6}, {-2, 6}, {-1, 6}, {0, 6}, {1, 6}, {2, 6}}) do
      game.surfaces[2].set_tiles{{position = position, name = "volcanic-smooth-stone"}}
    end

    for k, position in pairs ({{-11, 0}, {-10, 0}, {-9, 0}, {-8, 0}, {-7, 0},
                               {-11, 1}, {-10, 1}, {-9, 1}, {-8, 1}, {-7, 1}, {-6, 1}, {-5, 1},
                               {-11, 2}, {-10, 2}, {-6, 2}, {-5, 2}, {-4, 2}, {-1, 2},
                               {-5, 3}, {-4, 3}, {-3, 3}, {-2, 3},
                               {-4, 4}, {-3, 4}, {4, 4}, {5, 4}, {6, 4}, {7, 4}, {8, 4}, {9, 4}, {10, 4},
                               {4, 5}, {5, 5}, {6, 5}, {7, 5}, {8, 5}, {9, 5}, {10, 5},
                               {7, 6}, {10, 6}}) do
      game.surfaces[2].set_tiles{{position = position, name = "volcanic-soil-dark"}}
    end

    for k, position in pairs ({{-11, -5}, {-10, -5}, {-9, -5}, {-8, -5}, {-1, 5}, {0, -5}, {1, -5}, {2, -5}, {3, -5}, {4, -5}, {5, -5}, {6, -5}, {7, -5}, {8, -5}, {9, -5}, {10, -5},
                               {-11, -4}, {-10, -4}, {-9, -4}, {-8, -4}, {-1, -4}, {0, -4}, {1, -4}, {2, -4}, {3, -4}, {4, -4}, {5, -4}, {6, -4}, {7, -4}, {8, -4}, {9, -4}, {10, -4},
                               {-11, -3}, {-10, -3}, {-9, -3}, {-8, -3}, {-7, -3}, {-6, -3}, {0, -3}, {1, -3}, {2, -3}, {3, -3}, {4, -3}, {5, -3}, {6, -3}, {7, -3}, {8, -3}, {9, -3}, {10, -3},
                               {-9, -2}, {-8, -2}, {-7, -2}, {-5, -2}, {1, -2}, {2, -2}, {3, -2}, {4, -2}, {5, -2}, {6, -2}, {7, -2}, {8, -2}, {9, -2},
                               {2, -1}, {3, -1}, {4, -1}, {5, -1}, {6, -1}, {7, -1}, {8, -1},
                               {5, 0}, {6, 0}, {7, 0},
                               {5, 1}, {6, 1}}) do
      game.surfaces[2].set_tiles{{position = position, name = "volcanic-ash-cracks"}}
    end

    local create_list = {}
    table.insert(create_list, { name = "v-red-pita", position = {-3, 0}, amount = 1})
    for k, position in pairs ({{-10, -3}, {-8, -3}, {4, -3},
                               {8, 1}}) do
      table.insert(create_list, { name = "v-brown-carpet-grass", position = position, amount = 1})
    end
    for k, position in pairs ({{-10, 2},
                               {-8, 3}, {-7, 3}, {5, 3}, {7, 3},
                               {3, 4}, {6, 4},
                               {1, 5}}) do
      table.insert(create_list, { name = "tiny-rock-cluster", position = position, amount = 1})
    end
    game.surfaces[2].create_decoratives{decoratives = create_list}

    game.surfaces[2].freeze_daytime = true

    game.surfaces[2].set_chunk_generated_status({0, 0}, defines.chunk_generated_status.tiles)
    game.surfaces[2].set_chunk_generated_status({-1, -1}, defines.chunk_generated_status.tiles)
    game.surfaces[2].set_chunk_generated_status({0, -1}, defines.chunk_generated_status.tiles)
    game.surfaces[2].set_chunk_generated_status({-1, 0}, defines.chunk_generated_status.tiles)

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrNWu2SoyoQfRd+45Yg+JFXmUqlTELmUmvUC5jd3Km8+200idmNToCZH05NJQbwnD4tdrfgB9pWnWiVrA1afSC5a2qNVm8fSMv3uqxsW10eBVqhrSihE10wkvVe/EYrcsETw1Sz+ylMpGXVPIyllzVGojbSSDHg9z/Om7o7boUCMHwD0MeyqiJRiZ1Rche1TSUQRm2j4VzgBybAy39wjM6A+4NfrBl/oVE/NMI/h0v84Cj9HI7hv3z6hHCzhwEA+NCI4+A0uX/wtG6F2EfHZt9VIkrQOBDG1RtZn4C2UefhxPEXeFqbcvcTrWJr22QPuawv8P9sOn9per5U09OXphOyVNuz17azpdqev7Y9W6rtxUvb6WLnDIndjc8WZ7xnPqDJg5IpvDEjyPoga+iLdv8IbZ6holvwLQanXIdvtDBG1u+9biWOzUlsOuirjFBiv7m65FBWWmA0NA++vNK2kBiF1oAQdYAHvLums0mXxHChwLt2UGmiSpS9Vfcku57UM6Yk8btVABwZVda6bZSJtqKa0kX/0LWXCjzad7MpAvZEUDXlHrqegdkMLEbm3FqEpjNtZ9AUDffXQbx0pP4EsRdB5k3gh5974/s5qPDG95pINPbGT7zwiTc+88Kn3vjcC9//Tk698Jk3fuaFP97BfVCPZK2FMlOBIp/DJXQKOPUP2ST+1ph9fZY5dKIa4zUNCNc0C9BCvlVL1fyK9qLWllob1e1Mp8QXVeXhSeiq7tXkKr7AELswJLFvnpvAdUh0CfHmIUE8NDyhul2TJPkCg9s1YeE525GBf4HBzUtpcNp2lJCFE7gpyIMLG0cFRTiBkwIWB5c2bgoYCSdwU0CDiydHBUk4gZsCFlyeOSrg4QRuCtLgAtBRQRZO4KYgDy4xHRUU4QROCngcXMS6KeAknMBNAfUuk58tn6yTeeKPTNyQmfsK0q3yXtBS9RgYHvcknrPiPaDRXgL4RLYPZ7Wlsle/nw79eWW1UeLfDqr3zbU+ju1ZQ8u98v4Ym1Rz3Gy7w6Fvh9JbfLuj2Kyj2IOj5nrobE8y69zUY2oki5saDxH3tq4oaqHez3DzwOU7lLuJNcYoHeRYMcPl3Gj5n+hX8G5/U2Rj9NXdFkzrIWer/snlS144YZBPINL44XbYNjawTWTGzwDGENmWWsuTiFrVnCQ8w8w9y95DJJ9elU1p4Cqv3e2YBEw8pmW6uB0q5ueO6F7IFDPu4B7uKBbnjtR5n5QuLvukmfNO6QKNz933ShdofeG+W7o867PYfb90gdaH7tvZODQVwjLPFHFf/qMzL19kni9zsFd4nkF7vHHmALknYP4H4BqjX1DX2/nwRjDHFPM1foNPnPRH8IkJ6Q/tF06HAVClcAxlxv0YkpE9tt04G8bbJpwN420TBlP7437MAG+/cDacm7HbmPUw9+ycvr9thNEJCuJeB80JyxOepinjaUYvl/8BL7oZTg==",
      position = {-1, 0}
    }

    silo = game.surfaces[1].find_entities_filtered{name = "rocket-silo"}[1]
    roboport = game.surfaces[1].find_entities_filtered{name = "roboport"}[1]
    provider_chest = game.surfaces[1].find_entities_filtered{name = "passive-provider-chest"}[1]

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            storage.platform = player.force.create_space_platform({name="platform", planet="nauvis", starter_pack="space-platform-starter-pack"})
            storage.hub = storage.platform.apply_starter_pack()
            space_surface = storage.platform.surface
            space_surface.create_entities_from_blueprint_string
            {
              string = "0eNrtndFuG7e2QP9Fz9YBN8kZkgHul1wUhmKPE+HIkq8sBc0p8u93ZMe2kg6Hm1xtoh4EKNCmsUkOh+Ss4Wzu9cfi/eY4POzX28Pi3R+L9c1u+7h4979/LB7XH7arzen/bVf3w+Ld4nG3We2XD6vtsFl8uVqst7fD74t38uVq4mcPH/fHx8OwP/tB++W3q8WwPawP6+G5hqc/fL7eHu/fjz/5Tq5efnt1+tXd+nZ5s9tshpvDbr+4WjzsHsdf3W1PtYzFLcO/uqvF5/E/JP6rG6vZD4/HzWG53n4ay93tx7/ZHjebU+u+q8dW1dNcjXut5vGwuvn3+BuPw/7UJX++FHmrpH+q5Ha9H5vz9BNxomj/WvSH43Z5OO73w2Gq2PjS8i8ThXRXUzd2ohT3TeMmSuqVzZGvxYSpQoK+u77vrXHIHva7zfX74ePq03q8iePP3az3N8f14fp+dztc7+6udw/DfvVcyHhjXv52P6xurz+utrfXpzLGFo0D87A/DlMNjLqr7OYuMmn7vNTlYnQllQsS1WXNXpVY9b37ObdOnOoi5weoeGWXF+eLdOr+ql0ZRDcX51cGCXUrsaTXRnbfN/I0NtRLpijn2KmBz9VNNj9VrLzda9P99033U88OU1G2yXfL1L2zb1Nx+P1h7LTH5XF8dO4/7Hfjv5fvh81hdjH8cyVXi8Pnh1N56+3D8bCYqlM/dZe+8nL0D8Dakn1DR8F+qpiytbe91xc9M1rFTpUddMvB7HyysWo5mFsNfA2m1Uzj+Fqn+4HPFWdaZuxZY+1EB5WGopPKRdJNNt02Nd1rmr47HnJtd01Ls9Mszc5XlO3y13F6Yv2g4dP96R4c9qvt48Nuf8jeATtzB6bq0MK5f1lYJltaQednLdTdt9jQC5Lvhak11qXKV5TJXvBtD3878bz5MQPMK5eKNHvVFYiQLuGiHcMom8eD/MLmla/kYban9ZCx7C+hp/u6V+Lpi65YWrpLuGjlO4qbvegKtrEXcNGdUa6fcxfdScXyeQkXbXXwPHvNeuC5iEvWLWOzY7vTr2IXMbT7qg2w6UvWr2GXsIR1Eb0/Nz0gOx2BzT4fez1/XcLjsdfR1yx89Xr4ugT26l01y8+h/NTrQu/r9nKnu7VpO+cn9mvFHtHM69fkHlGvX7zmXpv9D+uL+vfFuZfmqdfFPrVsyem6O+hQav59PLRsFc9t3pw2PYpreLB1u4mTG0+hgoi+3dWbKqxlJ3hu/+2sH7IbcOFt8bjZHx8/lnavZGIP9Gb9VMf9cFhtNuub5dvG6qnE9fbD4uWnrv/vuNqM1Y8/vd3t71enL07rw3D//Al9fXv20X24uztV8mn86eU4346bYemePsA///j409vrs33X06+//Wls1tP9WLwzp2ue/Bv58tuX8Z+JLumb9t6kchEZ/+72tay79f7xcP0WefD1tn1a7w/Hp156adDTTyyHT8P+8+Gpa5/3h8eGnkIezOkP9w+rcVU6Vbb4n6e/bliXQmjaUbXf9UZ5FrL9MtE8ZENqqMPU1RGbNs/T7OApTd1Y8QoaKy+naUO911xOfizEet462+kSzbMw+voqusqua9gH95VV9PVV2MoqQn0VrrKKlqlfWUXDzK+c+MlUV1Fbg9QjYmUNtrqGyuGU6qd25WhK9TO7cmKn+oldOa9T37Dq9ugZkurneeWSm1r2ZxJ7kiT9K8/Mg3HyjUdM/YSvhQkxQnYeJBdl1/JQl5mZrgg1EeOUUYL29QJSrv1eG3AYi0W1fKx+nWmxGJUxbFfvN8P17frx9O/Fu7vV5nEok/jV+cvB0/9//tHTfsPpVWbyUmreVvrzjinH35nvd1Pu1pux5Nkq/LdVPP/G1/e7r0HWr4Wu97vtcrcfxnImXgy/f5P5bbKJsb6JXUUTJ15qPx63/yYtbnkd6b4de8VVSkxDJT5byeToOIu2HU7xU/uxl+6O++3qZph9a3vu9Yt77ZezyF/F9cSLvxxXczndxV+Or7kce/GX01Vcjrn4q+krrsZd/NWEiqvpL/5qYsXVpIu/mlRxNXLxy8BZCL7ici5+kT6L+p8/VlIk9PNY/rmSyq8NVv0G8rrM5o66WPUbSCgW1RFAC6rXSNuwT/j2QSNUfs/4W9557HTnBRJrHFR0ayOpo9fdoLfFbLPbflieume41UXihszAcoZ8UdG12wn5oqKsoyJS9639unt7Frmv7PdY7PaGLwuxskcaloxUWUVf2zF9sWMC+KqjbHXDVO0rq0gNJ3p1g9Eb8E1K13ov4JuUsoqWs3fKDnLgW5Sy9R58UVNWUREP7yo7qHrWSmnW+gA+zik7JIKPc8oqap+vxX7pwOc+XZs78LlPWYN+qpq6gdi59g+Jyrb79g+JyhoaIr6VvVM7TX1xNIbKErtiibH9M6qyf1P7Z1RdDX39HK2kgV7av5oqa2jIQqEbhQ1RzZWc2tfP0UpMrYh4jpW9UztHpfjI6GsnafkdryVquPIx1CfwCVpXRTANsdq62xgaHqKVz4lgQeS2soqK6OJKpj6LNVYOyuKjI9S/nkrlyn4emTu7vVjcfjuLb53fXizuCQZtmpeXcqZLSWS3yWfa1haV+lZudx7Em4/xqAlEfZtm3U87dCGxaW/J/8QGu7OsJY/D/fvNepy096ubj+vtaXd/ZuPHf0309jVI/25s/mp/P/7uh9V/xl9uCc1/fBjGtQJ8WrDZTwvu9Gnh6nI+aLQEDPfZET65FLcEDPfZMTkdDhL7hu2rTrUmx5Zcd15XdAQ7Y52yZxLYGlPW0RAjvHS1dQjYwdLWYcGmkLYOB3aFtHX49k0cbRVd+y6Otoq+fbNFW0Vo323RVhHbtwO0VaT2PQ1dFdaALQdtFWDPQVuFbd8a0Fbh2vcGtFV48ObqVUnuGsKHxdReRsthAJlbRBSB89YE8Fbra7OP/biQAWsiCn7vWtJE2IlQX0WlTnMP88kdG0J/pXJJtdKwv1K7poqtjtvJHKy24qrjdrJFqUOAfLEolDHP/ZxDCNOzS3oSdOKUAyKQSmzuLkTdDe2Lt1OZDzuVCrIGPMCc6gFmyQEjq6tCOX3L80QbwFeevNr4vfKKYtEBItUpMNsUvhcq6wikDpPrnUh6x1Rmpvlb1jmZvrBEojZ1t6QpgK+rrENIHUa3XjuLMsLqLsSREFdlHR7lqMjMEdc15V+tReyLzjJiz+IN89ln3o7o5nPP3Kz273fbf37uGevqj1z2M/OycLpxotvY6UbrYkvaV908TCR5x0W8m04/VVAEaO4Z3BDzOfMQuZy+su2Xle0qVzvn8lPO/+jzxNb7hkSSuie4VyQH06zO/y2ZwazvSWIG1SpXkUJ6Bgv+ybnHbENkcC3T+UTyLqqqaAgVrsX4jmzDGV0VFuwmKq+iIc9q/jV3cjOiIWz427dcRRUN3wT+Ca+8XQ+uSzkAQoMcR36e6sR2saHByvmmlHucNgk/Z3LC2N6AXZ0cJfUCCs29Bfe2IXtNtoWuPRfM1AycBbnd7+vb4a+juLOg6YcTNM1sKWQvvysWYUpF9N8UsTzsls/fqmYizJS7QRWZmZex1Myob2ZfNf36hnN+uVaexTdn7kdXKkEKJRQLsOqO6utuZ0VscrGfvLqRqepmhvpjAtk29oU7UZydZxHHmRJKkzNUp7q6mNUtVOQgL63y0bSznI4Wo7TXoIPFigDkPPD8sPBjGxvSnCvXkagzIMzizlkErUrx+vp5zyLBq43kA13ue3QkX+RynytjbE/k56p3ldc3IKOfPYvInclI35/dwNd9pu9XrX/mJtNZuPDNx+F+fbPaLB82pz2Wme9lUzqP134Zb8jyfhw6jX3xF8T7X1RUvz0Lli72cPqmg1+79PBxHFynKXR3fIog+NWpZ9HhxU7tf3WqslOdulNLfXpaHNf/eVpNf/Xr2RGAUr+mX/1a0a+dul9nH1336/3+RAnPu5a/HmS57u6rXwmzWOf/VqprOEryDdWW36kaTpJ8A+OKGhRk+l8Mpu7slIvmPSv/muUr3rKckYbNdtUBQ2ds1Wb75LuVMw68sGVObjvjQaFdrlAStKqL2ndN6ehVp26cCSBoUdv8CAI8tXUkELOorKMp/7utrINkgdTWYUHspbYOR9xdbQet3Pk5knH9W30YlofV0x5r7jNDblZLpy3Jl0pqOXK2tIqOyJ5WcgISzWnvL0g0p60iNZ8oVtbQciiksoYWDadls+D8kMjs2M0usZPP9fMTI7PFhrpiPVAZtU2PhnMmtctfwzGT2lW84ZRJ7QPPApGutorUHm2lrMKBs5vaKqT+U5yOzxrOe0iobDwIFVNehG8Pd9JeRFf/Nc0ri+5rvqZNU4ALteduMxnBnIu1x26zJaXaU7e5ks5i7QslSamkivfSl4dAnyvLlkJF+lJrXKmEYs94bbhKtoRiAJIrlVDx9mhKfRqq09xmi4qFCyteV1IG8uQK6EqxRKW725VCiUoDrCJrcGm0d9oDvaUp2PnKM8bZgrrKI8bZgvrKE8bZgkIxmO8FX1KuCGVmwvRUSpwuozRwX19Pc63o1VFw2RJEW0LMlXC2vB7vH6YWx9cWlF8D+uJSW7ozvVfmjJy5M2fRnnNlzBZRCmorXkdQLmvZAmLhxmTuyzT99NpVNjdOihGbpcF+FrA5d1PmZlwooUBx3odq4ZGYXFH60My39ShfWqde03ISW3cWiPnyBXZym7FQStBfVyheVtSukfn2JH17it0cjXZ9yrbnLAIy38uFPo762OPyJTnlSpVvjX4kF2947JTLRL41mlFcGsRRP4jLczNG7bKTb0+qZJ9sY5KpXsFcrihRrRelUqx+5cqW4VrWUtWXaZe8egnKNq9rWBKVrVOt2aX2BfWqli0iNqyyyktM2gUq0zhvTP1yqWqbN5opUGqd1S552RJc/QKsvD6vXrqyjesallJl61RLfal9tenqn0v67WpxWG+G5yiSP60x6esZzfTlrfCH1c1wCtg63O3298u7Uxc8nx04terP0Ra0BNwE3IIAC+jh79P6aQcIbQAfBK8DMeKB2F5Ch0vwuASHS7C4BMElGFoCHg54NARaQE8LwMMRj0Y8GPlYhAXQgUjrpx1A7wAdAnQM0klAZyFdBug6hFdCvBjj5wF+JOGnotBRwNnAvtzHgAknYMIJmHACJpyACSdgwgmYcAImnEAJJ1DCCZRwAiWcQAknUMIJlHACJZxACSdAwgmQcAIknAAJJ0DCCZBwAiScAAknQMIJkHACJZxACSdQwgmUcAIlnEAJJ1DCaS4AP49eEanHiNRjRGovIeASOlyCxyU4XILFJQguAY8oPKDweMLDqacF4OGIRyMejHwswgLoQKT10w6gd4AOAToG6SSgs5AuA3QdwishXozx8wA/kvBTUegowmyA8YQT0iuldZjSOkxpHaa09hJ6XEKHS/C4BIdLsLgEwSXgMYmHJB6ReEDi8YiHIx6NeDDysQgLoAOR1k87gN4BOgToGKSTgM5CugzQdQivhHgxxs8D/EjCT0X8YMZsgPEEE9JfAGkvJXiMeR5jnseY5zHmeYx5HmOex5jnMeZ5jHmeYp6nmOcp5nmKeZ5inqeY5ynmeYp5nmKeh5jnIeZ5iHkeYp6HmOch5nmIeR5inoeY5yHmeYp5nmKep5jnKeZ5inmeYp6nmOcp5nmKeR5TmsOU5jClOUxpDlOaw5TmMKU5TGkOU5rDlOYopTlKaY5SmqOU5iilOUppjlKao5TmKKU5SGkOUpqDlOYgpTlIaQ5SmoOU5iClOUhpDlKao5TmKKU5SmmOUpqjlOYopTlKaY5SmqOU5jClWUxpFlOaxZRmMaVZTGkWU5rFlGYxpVlMaZZSmqWUZimlWUppllKapZRmKaVZSmmWUpqFlGYhpVlIaRZSmoWUZiGlWUhpFlKahZRmIaVZSmmWUpqllGYppVlKaZZSmqWUZimlWUpp7Uvpy22Q5hIsLkFwCYaW8EqrgmlVMK0KplXBtCqYVgXTqmBaFUyrgmlVKK0KpVWhtCqUVoXSqlBaFUqrQmlVKK0KpFWBtCqQVgXSqkBaFUirAmlVIK0KpFWBtCqUVoXSqlBaFUqrQmlVKK0KpVWhtCqUVoUG+DWvRHQkYlT9C2j5ZSgaTOwGE7vBxG4wsRtM7AYTu8HEbjCxG0zsBhO7wcRuMLEbTOyGEruhxG4osRtK7IYSu6HEbiixG0rshhK7gcRuILEbSOwGEruBxG4gsRtI7AYSu4HEbiCxG0rshhK7ocRuKLEbSuyGEruhxG4osRtK7IYSu6HEbiixG0rshhJ7osCeKK8nius41zXOuZ4oqyeK6omSeqKgniinJ4rpiVJ6opBOU+/TzPs08X6CgJ4gnyeI5wnSeYJwniCbJ4bmiZF5YmCeGJcnhuWJUTk0TkDhBPRNJEbkCQJ5gjyeII4nSOMJwniCLJ4gilPbCJWNJMjhCWJ4ghSeIIRjhI4UoXE29UgRGttiIkXoSBEa62qwrQbLarCrBqtqsKmGimqop4ZqaqilhkpqqKOGKmqooYYKaqCfBuppoJ0GymmgmwaqaaCZBoppoJcGammolYZKaaiThippqJEmQoSOEKGpEIf6cCJE6AgROkKEjhSBA0VgnC0f+4SwTihQBA4UgbHPCOuMsM0Iy4ywywirjKjJiIqMqMeIaoyoxYhKjKjDiCqMqMEICoygvwjqi6C9CMqLoLsIqouguQiKi6C3iGqLqLWISouos4gqiwJE4AARmBqTqDCJ+pICROAAEThQBO4pAmMVAfZFYV0UtkX1FIGxbQrLprBrCqumsGkKi6aoZ4pqpqhlikqmqGOKKqaoYYoKpqhfCuqloF0KyqWgWwqqpaBZCoqloFcKaqWgVYpKpahTiiqlqFGKCqV6iMDUR0V1VNRGRWVUPUTgHiJwTxG4owjcUQTGlgbs4sIqLmziwiIu7OHCGi5s4cISLuzgogouauCiAi7q36L6LWrfovIt6t6i6i1o3oLiLejdgtotaN2C0i3o3ILKLWjcgsIt6tuiui1q26KyLeraoqotatqioi3q2aKarQ4icAcRuKMI7CkCe4rAWIGBPWVYU4YtZVhShh1lWFGGDWVYUIb9ZFRPRu1kVE5G3WRUTUbNZFRMRr1kVEsGrWRQSgadZFBJBo1kUEgGfWRQRwZtZFBGRl1kVEVGTWRUREY9ZFRDRi1kVEJGHWQeIrCHCOwhAnuKwI4isKMIjP0iWAKHHXBYAYcNcFgAh/1vWP+G7W9Y/kbdb1T9Rs1vVPxGvW9U+0atb1T6Rp1vUPkGjW9Q+AZ9b1D3Bm1vUPYGXW9Q9QZNb1T0Rj1vVPNGLW9U8kYdb1TxRg1vVPDmIAI7iMAOIjDGPyyXw245rJbDZjkslsNeOayVw1Y5KpWjTjmqlKNGOSqUoz45qpOjNjkqk4MuOaiSgyY5KJKDHjmokYMWOSiRgw45qJCjBjkqkKP+OKqPo/Y4Ko+j7jiqjqPmOIsVENgAgQUQ2P+A9Q/Y/oDlD9j9gNUP2PyAxQ/Y+0C1D9T6QKUP1PlAlQ/U+ECFD9T3QHUP0PYAZQ/Q9QBVD9D0AEUP0PMANQ/Q8gAlD9TxQBUP1PBABQ/U70D1DtTuQOUO1O1A1Q7U7AAJlCrIqICM6seofIyqx6h4jGrHqHSMKseocIzqxqBsDKrGoGgMasagZAwqxqBgDOrFoFyMqcWYWIxpxZhUjCnFmFCM6cSYTIypxJhIDGrEoEQMKsSgQAzqw6A8DKrDoDgMasOgNAwqw6jclm5s0n1Nuq1JdzXppibd06RbmnRHk25o0v1Mup0JdzPhZibcy4RbmXAnE25kwn1MuI0JdzHZJibbw2RbmGwHk21gsv1Ltn3Jdi/Z5iXbu4Rbl3DnEm5cwn1LuG0Jdy3hpiXcs4RblnDHEm5Y0v1KC7nSQq60kCtpvCQNl6TRkjRYksZK0lBJGilJAyVhnCQMk4RRkjBIEsZIwhBJGCEJAyRhfCQLj2TRkSw4ksVGstBIFhnJAiNZXCQLi2RRkTAoEsZEwpBIGBEJAyJhPCQMh4TRkDAY0jKutIwraSQmPYlND2LTgzj0GDY9hU0PYdMz2PQINj2BTQ9g0/PX8Pg1PH0ND1/Ds9fw6DU8eQ0PXsNz1/DYNTt1zQ5dszPX7Mg1O3HNDlyz89bsuDU7bc0OW8Oz1vCoNTxpDQ9aw3PW8Jg1PGUND1nDM9bwiDU8YU1T/NAklzTHJU1xSTNc0gSXNL8lTW9Js1vS5JY0tyVNbQkzW8LEljCvJUxrCbNawqSWMKclTGkJM1qyhJYsnyVLZ8myWbJkliyXJUtlyTJZskSWLI8lTGMJs1jCJJYwhyVMYQkzWMIEljB/JUxfCbNXwuSVNHs69QdRfRC1B1F5EHUHUXUQNQdRcRD1BlFtELUGQWkQdAZBZRA0BkFhEPQFQV0QtAVBWRBzBTFVEDMFMVEQ8wQxTRCzBDFJEHMEMUUQNARBQRD0A0E9ELQDQTkQdANBNRA0A0ExEPQCUa0PdbtTtTs1u1OxO/W6U607tbpTqTt1ulOlOzW6U6E79LlDnTu0uUOZO3S5Q5U7NLlDkTv0uDONO7O4M4k7c7gzhTszuDOBO/O3M307s7dDeTt0t0N1OzS3Q3E79LZDbTu0tkNpO3S2Q2U7NLZTYXuAWBsg1gaItQFibYBYGyDWBoi1AWJtgFgbINYGiLUBYm1gWBsY1gaGtYFhbWBYGxjWBoa1gWFtYFgbENYGhLUBYW1AWBsQ1gaEtQFhbUBYGxDWBoS1gWFtYFgbGNYGhrWBYW1gWBsY1gaGtYFhbWBYGxjWBoa1AWJthFgbIdZGiLURYm2EWBsh1kaItRFibYRYGyHWRoi1EWJtZFgbGdZGhrWRYW1kWBsZ1kaGtZFhbWRYGxHWRoS1EWFtRFgbEdZGhLURYW1EWBsR1kaEtZFhbWRYGxnWRoa1kWFtZFgbGdZGhrWRYW1kWBsZ1kaGtRFibYJYmyDWJohVCWJVgliVIFYlhlWJYVViWJUYViWGVYlhVWJYlRhWJYZVCWFVQliVEFYlhFUJYVVCWJUQViWEVQlhVUJYlRhWJYZViWFVYg/3xB7uiT3cE3y4C04tTp01QqUpQq0pQrUpQr0pAsUpAs0pAtUpAt0pAuUpAu0pAvUpAv0pAgUqwgwqwhQqwhwqwiQqwiwqwjQqwjwqwkQqwkwqwlQqAl0qAmUqAm0qAqUeAq0e7b+PH71fO4DmfxYsFsFmD6z2wG4PLPfAdg+s98B+Dyz4oIYPqvigjg8q+aCWD6r5oJ4PKvqgpg+o+oCuDyj7gLYPqPuAvg8o/IDGD6j8gM4PKv2g1g+q/aDeDyr+oOYPqv6g9g2q3xAIgEIBkCZqFmoAEargEOrgECrhEGrhEKrhEOrhECriEGriEKjiEOjiECjjEGjjEKjjEOjjECjkEGjkEKjkEObkECblEGblEKblEOblECbmEGbmEKbmEObmECbnEGjnEKjnEOjnECjoEGjoEKjoEOjoEKjJEOjJaP99jF9fBwDNqCxU1SHUlSFUliHUliFUlyHUlyFUmCHUmCFUmSHQmSFQmiHQmiFQmyHQmyFQnCHQnCFQnSHQnSFMniHMniFMnyHMnyFMoCHMoCFMoSHMoSFMoiHMoiFQoyHQoyFQpCHQpCFQpSHQpSFQpiHQZyFQaNH++xi/vg4AmvpYqFNDqNRCqNVCqNZCqNdCoFpBoFtBoFxBoF1BWJ5/YYn+hWX6F5bqX2DSeYFZ5wWmnReYd15g6neBud/bf1/+ovWLZk8Xmj5daP50gSm8BebwFpjEW2AWb2H5pIUllBaWUVpYSmmByY0FZjcWmN5YYH5j5e//drVYH4b78Yfeb47Dw369PSyuFp+G/eNTiTaKj67r+953ve2+fPl/nXviBA==",
              position = {0, -2}
            }
            tank1 = space_surface.find_entities_filtered{name = "storage-tank"}[1]
            tank2 = space_surface.find_entities_filtered{name = "storage-tank"}[2]
            tank3 = space_surface.find_entities_filtered{name = "storage-tank"}[3]
            tank4 = space_surface.find_entities_filtered{name = "storage-tank"}[4]
            tank1.insert_fluid{name = "thruster-fuel", amount = 25000}
            tank2.insert_fluid{name = "thruster-fuel", amount = 25000}
            tank3.insert_fluid{name = "thruster-oxidizer", amount = 25000}
            tank4.insert_fluid{name = "thruster-oxidizer", amount = 25000}

            assembler = space_surface.find_entities_filtered{name = "assembling-machine-3"}[1]
            assembler.insert({name = "firearm-magazine", count = 200})

            turrets = space_surface.find_entities_filtered{name = "gun-turret"}
            for k, turret in pairs (turrets) do
              turret.insert({name = "firearm-magazine", quality = "legendary", count = 200})
            end

            furnaces = space_surface.find_entities_filtered{name = "electric-furnace"}
            for k, furnace in pairs (furnaces) do
              furnace.insert({name = "iron-ore", count = 100})
            end

            collectors = space_surface.find_entities_filtered{name = "asteroid-collector"}
            for k, collector in pairs (collectors) do
              collector.insert({name = "metallic-asteroid-chunk", count = 20})
              collector.insert({name = "carbonic-asteroid-chunk", count = 20})
              collector.insert({name = "oxide-asteroid-chunk", count = 20})
            end
          end,
          condition = story_elapsed_check(3),
          action = function()
            game.simulation.camera_zoom = 0.5
            player.set_controller{type = defines.controllers.remote, surface = space_surface}
            local silo_position = silo.position
            silo.destroy()
            silo = game.surfaces[1].create_entity{name = "rocket-silo", position = silo_position, force = "player", create_build_effect_smoke = false}
            silo.rocket_parts = 100
          end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = storage.hub.position, speed = 0.2}) end,
          action = function() player.opened = storage.hub end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "logistics-button-space", data = "0", data2 = "1"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-id-base", data = "transport-belt"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function()
            game.simulation.control_press{control = "confirm-gui", notify = false}
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function() player.opened = nil end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            game.simulation.camera_zoom = 2
            player.set_controller{type = defines.controllers.remote, surface = game.surfaces[1]}
          end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = silo.position, speed = 0.2}) end,
          action = function() player.opened = silo end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "check-box", data = "gui.controlled-by-transitional-requests"})
            return game.simulation.move_cursor({position = target, speed = 0.15})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(1),
          action = function() player.opened = nil end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            roboport.insert({name = "logistic-robot", count = 5})
            provider_chest.insert({name = "transport-belt", count = 100})
          end
        },
        {
          condition = story_elapsed_check(11),
          action = function() game.speed = 2 end
        },
        {
          condition = story_elapsed_check(12),
          action = function()
            game.speed = 1
            game.simulation.camera_zoom = 0.5
            player.set_controller{type = defines.controllers.remote, surface = space_surface}
          end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = storage.hub.position, speed = 0.2}) end,
          action = function() player.opened = storage.hub end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "text-button-localised-substring", data = "gui-train.add-station"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function()
            game.simulation.mouse_click()
          end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "text-button-substring", data = "[planet=vulcanus]"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        { condition = story_elapsed_check(0.5) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "train-schedule-action-button"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() player.opened = nil end
        },
        {
          condition = story_elapsed_check(4),
          action = function() game.speed = 10 end
        },
        {
          condition = story_elapsed_check(70),
          action = function() game.speed = 1 end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            pad = game.surfaces[2].create_entity{name = "cargo-landing-pad", position = {0, 1}, force = "player", create_build_effect_smoke = false}
            game.simulation.camera_zoom = 2
            player.set_controller{type = defines.controllers.remote, surface = game.surfaces[2]}
          end
        },
        { condition = story_elapsed_check(1) },
        {
          condition = function() return game.simulation.move_cursor({position = pad.position, speed = 0.2}) end,
          action = function() player.opened = pad end
        },
        { condition = story_elapsed_check(0.25) },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "logistics-button", data = "0"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = function()
            local target = game.simulation.get_widget_position({type = "signal-id-base", data = "transport-belt"})
            return game.simulation.move_cursor({position = target, speed = 0.3})
          end
        },
        {
          condition = story_elapsed_check(0.25),
          action = function() game.simulation.mouse_click() end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() game.simulation.control_press{control = "confirm-gui", notify = false} end
        },
        {
          condition = story_elapsed_check(2),
          action = function() player.opened = nil end
        },
        {
          action = function() game.speed = 10 end
        },
        {
          condition = story_elapsed_check(8),
          action = function() game.speed = 1 end
        },
        {
          condition = story_elapsed_check(12),
          action = function()
            game.simulation.camera_zoom = 2
            player.set_controller{type = defines.controllers.remote, surface = game.surfaces[1]}
          end
        },
        {
          init = function()
            storage.platform.destroy()
            pad.destroy()
            local silo_position = silo.position
            silo.destroy()
            silo = game.surfaces[1].create_entity{name = "rocket-silo", position = silo_position, force = "player", create_build_effect_smoke = false}
            roboport.clear_items_inside()
          end,
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.heating_mechanics =
{
  init_update_count = 120,
  planet = "aquilo",
  mute_wind_sounds = false,
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.forces.player.recipes["ammonia-rocket-fuel"].enabled = true

    for x = -15, 14, 1 do
      for y = -8, 10 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "ammoniacal-ocean"}}
      end
    end

    for x = -15, 14, 1 do
      for y = -8, 10 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "ice-platform"}}
      end
    end

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "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",
      position = {2, 0}
    }

    reset_items = function()
      local heating_towers = game.surfaces[1].find_entities_filtered{name = "heating-tower"}
      storage.heating_tower = heating_towers[1]
      storage.heating_tower.insert({name = "rocket-fuel", count = 4})
    end

    start = function()
      storage.wait = 180
      script.on_nth_tick(1, function()
        storage.wait = storage.wait - 1
        if storage.wait == 0 then
          reset_items()
        end
      end)
    end

    start()
  ]]
}

simulations.space_platform =
{
  mute_wind_sounds = false,
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "Spaceman"}
    storage.character = player.character
    storage.platform = player.force.create_space_platform({name="platform", planet="nauvis", starter_pack="space-platform-starter-pack"})
    storage.platform.apply_starter_pack()
    player.teleport({0, 0}, game.surfaces[2])
    game.simulation.camera_zoom = 1
    game.simulation.camera_player = player
    game.simulation.camera_player_cursor_position = player.position
    game.simulation.camera_position = {0, 0}
    hub = game.surfaces[2].find_entity("space-platform-hub", {0, 0})

    local story_table =
    {
      {
        {
          name = "start",
          init = function()
            player.cursor_stack.set_stack{name = "space-platform-foundation"}
            storage.character.cursor_ghost = {name = "space-platform-foundation"}
          end,
          condition = function() return game.simulation.move_cursor({position = {-6, 4}}) end,
          action = function() game.simulation.control_down{control = "build-ghost", notify = false} end
        },
        { condition = function() return game.simulation.move_cursor({position = {-10, 4}, speed = 0.1}) end },
        { condition = function() return game.simulation.move_cursor({position = {-10, -6}, speed = 0.2}) end },
        { condition = function() return game.simulation.move_cursor({position = {-8, -6}, speed = 0.3}) end },
        { condition = function() return game.simulation.move_cursor({position = {-8, 2}, speed = 0.3}) end },
        { condition = function() return game.simulation.move_cursor({position = {-6, 2}, speed = 0.3}) end },
        { condition = function() return game.simulation.move_cursor({position = {-6, -6}, speed = 0.3}) end },
        { condition = function() return game.simulation.move_cursor({position = {10, -6}, speed = 0.4}) end },
        { condition = function() return game.simulation.move_cursor({position = {10, 4}, speed = 0.4}) end },
        { condition = function() return game.simulation.move_cursor({position = {6, 4}, speed = 0.4}) end },
        { condition = function() return game.simulation.move_cursor({position = {6, -4}, speed = 0.4}) end },
        { condition = function() return game.simulation.move_cursor({position = {8, -4}, speed = 0.4}) end },
        {
          condition = function() return game.simulation.move_cursor({position = {8, 2}, speed = 0.4}) end,
          action = function() game.simulation.control_up{control = "build-ghost"} end
        },
        {
          init = function()
            player.clear_cursor()
            player.cursor_stack.clear()
          end,
          condition = function() return game.simulation.move_cursor({position = {0, 5}}) end
        },
        {
          init = function()
            player.cursor_stack.set_stack{name = "asteroid-collector"}
            storage.character.cursor_ghost = {name = "asteroid-collector"}
            game.simulation.camera_player_cursor_direction = defines.direction.west
          end,
          condition = function() return game.simulation.move_cursor({position = {-11, 3}}) end,
          action = function() game.simulation.control_press{control = "build-ghost", notify = false} end
        },
        {
          condition = function() return game.simulation.move_cursor({position = {-11, -6}}) end,
          action = function() game.simulation.control_press{control = "build-ghost", notify = false} end
        },
        {
          init = function()
            player.clear_cursor()
            player.cursor_stack.clear()
          end,
          condition = function() return game.simulation.move_cursor({position = {0, 5}}) end
        },
        {
          init = function()
            player.cursor_stack.set_stack{name = "crusher"}
            storage.character.cursor_ghost = {name = "crusher"}
            game.simulation.camera_player_cursor_direction = defines.direction.east
          end,
          condition = function() return game.simulation.move_cursor({position = {8, 1}}) end
        },
        {
          init = function() game.simulation.control_down{control = "build-ghost", notify = false} end,
          condition = function() return game.simulation.move_cursor({position = {8, -3}}) end,
          action = function() game.simulation.control_up{control = "build-ghost"} end
        },
        {
          init = function()
            player.clear_cursor()
            player.cursor_stack.clear()
          end,
          condition = function() return game.simulation.move_cursor({position = {0, 5}}) end
        },
        {
          condition = story_elapsed_check(1),
          action = function() hub.insert({name = "space-platform-foundation", count = 50}) end
        },
        {
          condition = story_elapsed_check(3),
          action = function() hub.insert({name = "space-platform-foundation", count = 50}) end
        },
        {
          condition = story_elapsed_check(3),
          action = function() hub.insert({name = "space-platform-foundation", count = 50}) end
        },
        {
          condition = story_elapsed_check(3),
          action = function() hub.insert({name = "space-platform-foundation", count = 50}) end
        },
        {
          condition = story_elapsed_check(3),
          action = function() hub.insert({name = "asteroid-collector", count = 2}) end
        },
        {
          condition = story_elapsed_check(2),
          action = function() hub.insert({name = "crusher", count = 3}) end
        },
        {
          condition = story_elapsed_check(5),
          action = function()
            for k, entity in pairs (game.surfaces[2].find_entities_filtered{name = "crusher"}) do
              entity.order_deconstruction("player")
            end
            for k, entity in pairs (game.surfaces[2].find_entities_filtered{name = "asteroid-collector"}) do
              entity.order_deconstruction("player")
            end
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
            for k, v in pairs (game.surfaces[2].find_tiles_filtered{position = {-15, 0}, radius = 10}) do
              v.order_deconstruction("player")
            end
            for k, v in pairs (game.surfaces[2].find_tiles_filtered{position = {15, 0}, radius = 10}) do
              v.order_deconstruction("player")
            end
            for k, v in pairs (game.surfaces[2].find_tiles_filtered{position = {0, -17}, radius = 12}) do
              v.order_deconstruction("player")
            end
            for k, v in pairs (game.surfaces[2].find_tiles_filtered{position = {-6, -6}, radius = 1}) do
              v.order_deconstruction("player")
            end
            for k, v in pairs (game.surfaces[2].find_tiles_filtered{position = {6, -6}, radius = 1}) do
              v.order_deconstruction("player")
            end
          end
        },
        {
          condition = story_elapsed_check(2),
          action = function()
            hub.clear_items_inside()
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.removing_trash_in_space =
{
  init_update_count = 120,
  mute_wind_sounds = false,
  init =
  [[
    player = game.simulation.create_test_player{name = "Spaceman"}
    storage.platform = player.force.create_space_platform({name="platform", planet="nauvis", starter_pack="space-platform-starter-pack"})
    storage.hub = storage.platform.apply_starter_pack()
    player.teleport({0, 0}, game.surfaces[2])
    game.simulation.camera_player = player
    game.simulation.camera_position = {28, 4}
    game.simulation.hide_cursor = true
    game.surfaces[2].create_entities_from_blueprint_string
    {
      string = "0eNql2+FO2zAUhuF78e8E+Rw7ofRWJlSF1mXR0qRKXDSGeu9z2oohYKjm3T9ofeKk3tOjo48X89Adwn5s+2iWL6ZdD/1klj9ezNQ+9k03/y4+74NZmjaGnSlM3+zmn7bNFMs4Nv20H8ZYPoQummNh2n4TfpulHO8LE/rYxjacy51+eF71h91DGNMbXguFLqzj2K7L0Ifx8blMGwnjtlmHdK39MKUKQz/vIlWtC/NslqVL19m0Y1p2eskX5uGw3YZxNbV/UkWxr/+OxYcL6+uF237b9umlcv0zTPHj1aS+qc4XlJvqdGvn96+mEGPbP07z+8awG57C6pBe69K+w2Y1P6b00rbpplCY86/Pj+By3V2ITdelG05PMIxDu0kbOPS/0gbWw2H+FNKz2Q2b+a1NLLvQnDb378EeP7kr9+aupjCmul/dj03380kR/+WH+7He7aWePT2et5/IJ8WrzOJ1TvE6s/hdTvHbzOKLnOKLvOIqOcXvMovbnOJiM6u7rOqSWV2zqmtm9epSXd5XX3xW3X2zur2qeuZ/U/VZT6b65t71qr3X36zurqp+e4WCWv+vpOj8pRXb7vKN9W6hP9s5L7pcZNqnb6ly3zVxO4y7cpv03jSnFfPm3i2v2PKaLb9lyxds+R1bPkuD1gtcr3C9g+vh0RN49gQePoGnT+DxE3j+FJ4/hedP4flTeP4Unj+F50/h+bts3zO5PZPbM7k9k9szuT2U20O5PZTbQ7k9lNtDuT2U20O5PZTbQ7k9lNtDuT2U20O5PZTbQ7k9lNszuR2T2zG5HZPbMbkdk9tBuR2U20G5HZTbQbkdlNtBuR2U20G5HZTbQbkdlNtBuR2U20G5HZTbQbkdk1uZ3MrkVia3MrmVya1QboVyK5RbodwK5VYot0K5FcqtUG6FciuUW6HcCuVWKLdCuRXKrVBuZXILk1uY3MLkFia3MLkFyi1QboFyC5RboNwC5RYot0C5BcotUG6BcguUW6DcAuUWKLdAuQXKLUhui+C2yG2L2LZIbYvQtsxsy8i2TGzLwLbMa8u4tkxry7C2zGrLqLZMasugtsxpy5i2TGnLkLbMaIuIZr01a61ZZ80aa9ZXw7YadtWwqYY9NWypYUcNG2rYT8N2GnbTsJmGvTRspWEnDRtp2EfDNpp10WxwzebWbGzNptZsaA1n1nBkDSfWcGAN59VwXA2n1XBYDWfVcFQNJ9VwUA3n1HBMDafUcEgNZ9RsRM1SISwUwjIhLBLCEiEwEALzIDAOAtMgMAwCsyAwCgKTIDAIAnMgMAYCUyAwBAIzIDACAhMgMADC8h8scs0S1yxwzfLWLG4N09YwbA2z1jBqDZPWMGgNc9YwZg1T1jBkDTPWMGINE9YwYA3z1TBeDdPV1y2/L85/wL988/f+hXkK43QqqAvxC1fVde2rSqrj8S8okpjA",
      position = {15, 0}
    }
  ]]
}

simulations.space_science =
{
  init_update_count = 120,
  mute_wind_sounds = false,
  init =
  [[
    player = game.simulation.create_test_player{name = "Spaceman"}
    storage.platform = player.force.create_space_platform({name="platform", planet="nauvis", starter_pack="space-platform-starter-pack"})
    storage.hub = storage.platform.apply_starter_pack()
    player.teleport({0, 0}, game.surfaces[2])
    game.forces.player.recipes["space-science-pack"].enabled = true
    game.forces.player.recipes["carbonic-asteroid-crushing"].enabled = true
    game.forces.player.recipes["oxide-asteroid-crushing"].enabled = true
    game.forces.player.recipes["metallic-asteroid-crushing"].enabled = true
    game.simulation.camera_player = player
    game.simulation.camera_position = {-16, -6}
    game.simulation.camera_zoom = 1.1
    game.simulation.camera_alt_info = true
    game.simulation.hide_cursor = true
    game.surfaces[2].create_entities_from_blueprint_string
    {
      string = "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",
      position = {0, 0}
    }
  ]]
}

simulations.asteroid_defense =
{
  mute_wind_sounds = false,
  init =
  [[
    require("__core__/lualib/story")

    player = game.simulation.create_test_player{name = "Spaceman"}
    storage.platform = player.force.create_space_platform({name="platform", planet="nauvis", starter_pack="space-platform-starter-pack"})
    storage.platform.apply_starter_pack()
    player.teleport({0, 0}, game.surfaces[2])
    game.simulation.camera_zoom = 1
    game.simulation.camera_player = player
    game.simulation.camera_position = {32, -7}
    game.simulation.hide_cursor = true
    game.forces.player.recipes["metallic-asteroid-crushing"].enabled = true
    game.forces.player.recipes["oxide-asteroid-crushing"].enabled = true
    game.forces.player.recipes["carbonic-asteroid-crushing"].enabled = true
    surface = game.surfaces[2]

    surface.create_entities_from_blueprint_string
    {
      string = "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",
      position = {11, 0}
    }

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(3),
          action = function() surface.create_entity{name="small-oxide-asteroid", position = {18, -22}, velocity = {-0.02, 0.07}} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() surface.create_entity{name="small-carbonic-asteroid", position = {42, -22}, velocity = {0.02, 0.08}} end
        },
        {
          condition = story_elapsed_check(2.5),
          action = function() surface.create_entity{name="small-metallic-asteroid", position = {15, -22}, velocity = {0.01, 0.09}} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() surface.create_entity{name="small-oxide-asteroid", position = {41, -22}, velocity = {-0.02, 0.07}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() surface.create_entity{name="small-carbonic-asteroid", position = {35, -22}, velocity = {-0.03, 0.09}} end
        },
        {
          condition = story_elapsed_check(3),
          action = function() surface.create_entity{name="small-carbonic-asteroid", position = {22, -22}, velocity = {0.01, 0.07}} end
        },
        {
          condition = story_elapsed_check(0.5),
          action = function() surface.create_entity{name="small-oxide-asteroid", position = {41, -22}, velocity = {-0.01, 0.03}} end
        },
        {
          condition = story_elapsed_check(2,5),
          action = function() surface.create_entity{name="small-metallic-asteroid", position = {22, -22}, velocity = {0, 0.09}} end
        },
        {
          condition = story_elapsed_check(2),
          action = function() surface.create_entity{name="small-oxide-asteroid", position = {16, -22}, velocity = {0.02, 0.08}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function()
             surface.create_entity{name="small-metallic-asteroid", position = {30, -22}, velocity = {-0.04, 0.07}}
            story_jump_to(storage.story, "start")
          end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.spoilables =
{
  init =
  [[
    require("__core__/lualib/story")
    player = game.simulation.create_test_player{name = "Quality Manager"}
    player.teleport({-9, 0})
    game.simulation.gui_tooltip_interval = 0.5
    game.simulation.camera_player = player
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_player_cursor_position = player.position
    player.character.direction = defines.direction.south

    player.insert("raw-fish")
    player.clear_inventory_highlights()
    player.opened = player

    local story_table =
    {
      {
        {
          name = "start",
          condition = function()
            local target = game.simulation.get_slot_position{inventory_index = defines.inventory.character_main, slot_index = 0}
            return game.simulation.move_cursor({position = target})
          end
        },
        {
          condition = story_elapsed_check(10),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.spoilables_research =
{
  init_update_count = 360,
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_alt_info = true
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrVmttu2zgQht+F11IhnnQIsE9SFIYs015idSpJtckGfvel7NhxEjLhDHyxzY0RSf6GHPKf+S3pmWz7Rc1Gj448PBPdTaMlD9+fidWHse3XY2M7KPJA9q11uTPtaOfJuHyrekeOGdHjTj2SB3r8kRE1Ou20OgNO/zxtxmXYKuMvyN6A+qnd+cMZmSfrvzONayTPyRnPyJP/LL5JT99po7rzacoy4p7mlTAtbl7W6B+isGsUPe716E/l3d/KulAg+k3ehrp8YWOVc3o82PVCo4bpl9os/lzvlFG7jXZq8Kf2bW9VRs6HzxN+CdwubhraNVJuO63GTuVz2/3jR9BNy5plVhQZGabd6WKfCdWexveayGNgYjz7bB0Cs2teZkff57EO0AWUXsfolAXwEoqvQPgSii9B+OqKV4+zUdbmdu61c+HtKy/sBHINIosXcpFAbmBqoyix0QIWBSdpShGavq+k++mgrdPdPQVNMaWK3nVaPtygu7a/67TQhYqlFCoqsHiehJcoRbIERdISJhaGE0uF2FXsrrtqNtNu6e7d/2iNXXiZtPANFi9S8KzA4sv3eBHCU2z/TsMzbP9Ow3Ns/07Dg0uGBOHB5kaA8GBzw0D4CornIDxYtRSEB6u2gOA5VLUUpFoOVS0FqZa/qtY6X4BzPVplwp3sSvbCDf76gEqUgiTKoRKloALDJSAT8otMQPVIQXLnUD1SULHiUD1SUDXhUD1SUDURYD2C5C7AegQVKwHtoqBiIqAKBdUSARUoSP4C2kJB6hepxjvGvNpuPUZctwC47rc7Hma6nVlUqCiJGhD/oon6ngNIvt/Q3MQO/7iJZlkWWBtap92lolgfmshnWKeYyOdYo5vIF1ivmMiXWKubyC+xZjSRX6XbjKsRbUJK8OIzRu/U5sTZWP2vOt1Q/BgS7a+bsL2Rr0Lu2+1nTjECKIuvAPILAMValDqlG5QQV8xjiyQAa1Ry7IRiGRJYG5SWIYm1QWn4EmmD0ugV0gal0WukDUqjN0gblESvCpANqhE2qKJwG3RPF1IxbDVct3CQyNHEIkIU2GoQJUo0MTZrdKNc0UFihSbyCBH9SzY6xgZNjIyxLtCzFhEiRRNlhHjTD5et72Wnb4fuuLwMLAhBt7joRPEyiU1UolNXRoh4mURuLtUVetaxMeJlEhtjA3jCdKnyFFvmw29YHIzult4tJvrsEvGEqXmn1s/cO3s7r3f2/XbIl5hZyuB/Lm3vh+SvGicztP1pPsPcmtZNfoTkL7K+ZbNYtbmGOCcp2Yw2+AJSh/dDw9A7LEbkyQtBaXQhxP97HUS6iq72/Y9Q0c0T9N6vhY+Rq1GZw5NfRz+Efdup4JOT85Po9d2W7bLfK3NJXnH9C0UrQd3L49eF++13yZqK7775ycwz5A9/dM2X57y+DpcRv5r2RGE1FTWXZVkKWVbsePwPJCbxoA==",
      position = {0, 0}
    }
    local technology = "rocket-fuel-productivity"
    local technologies = prototypes.technology

    for name, prerequisite in pairs (technologies[technology].prerequisites) do
      game.forces.player.technologies[name].researched = true
    end

    chest_1 = game.surfaces[1].find_entity("infinity-chest", {-6.5, 8.5})
    chest_2 = game.surfaces[1].find_entity("infinity-chest", {6.5, 8.5})

     step_1 = function()
      local wait = 70
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait == 0 then
          step_2()
        end
      end)
    end

    step_2 = function()
      script.on_nth_tick(1, function()
        if chest_1 then
          chest_1.insert({name = "agricultural-science-pack", count = 1})
        end
        if chest_2 then
          chest_2.insert({name = "agricultural-science-pack", count = 1, spoil_percent = 0.95})
        end
        step_1()
      end)
    end

    game.forces.player.laboratory_speed_modifier = 3
    game.forces.player.add_research(technology)

    script.on_event(defines.events.on_research_finished,
    function(event)
      if not event.by_script then
        event.research.researched = false
        event.research.force.add_research(event.research.name)
        event.research.force.research_progress = 0
      end
    end)

    step_1()
  ]]
}

simulations.spoilables_result =
{
  init_update_count = 200,
  planet = "gleba",
  init =
  [[
    game.simulation.camera_position = {0, 1.5}
    game.simulation.camera_alt_info = true
    game.forces.player.recipes["biochamber"].enabled = true
    game.forces.player.recipes["jellynut-processing"].enabled = true

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNrNmmFv2yAQhv8Ln+3JGINN/so0RU5CWjYHZ4CnZlX/+3DSJt1K2rtrK61SPzQkz3ucOXiP5p6thsnsvXWRLe6ZXY8usMXXexbsjeuH+TXX7wxbsG0fYhl978J+9LFcmSGyh4JZtzF3bMEfvhXMuGijNSfA8Y/D0k27lfHpDcUTyLqtdWmoXN+aEFnB9mNIHxvdLJZQZdN+kQU7sEWrv8ijxOkDy2BitO4mzG/0Zjf+MsspjQ3ReLNZ2mh2aSj6yRTs9OopkkddN0VvU1QhSa7HaZ5wCmo3bubBPpaD6Y/hXGb08FC8mEd9noe523sTQjmM/SaNZOahns9iY71Zn4abgsXDfmaMU9xPcx5f6IjitcRnxJqnpHX/ynUZfEPGawheIrIkrnB5DUiTQiyr6j3LatsPweQWRIuIgH9KBB082UK/Y0lq5JoRLWpJ8orMB61JzhF5Uu9ZlLyGrwnR/MebHSfvQl31YoXl+OhtSOD4EsuvcXyF5T/tAB0HLdkWy69w/I4cfwXia3L8IH6N3jL0VT6vcwIcK9AhBWrqpgcVEORHXIMeQUN+xDC+JMcvQHxFjh/Gb8nxNyB+R44fxtfk+CWELypy/DA+J8evQPyaHD+MT6/fFsSn1y+ML+FeSJ7dA9UL5UyMUHDfJ8Vz/bzvs+5ay4Ytdcn/nu9be7nA1rqskALoYtc4gQZd7R1SAF3uLVIAXe8KKYAueIkUIPf+UAFJdvVAAUW29UAB+qENu32hH9owPv3QhiVI0k9tDWmsJCcbexi/Jvt6GF+QbT2Mj61hoXB8bAmLBsfHVrCQOD62gEWN42MLWAgcH33XhqsvhW6cOY6PuGur9TXw25ZLIW7a6vYz3KW6VPpqGn6U1gXj45Wb7scA9Ny651gNmHXej66yLhW8suP6tj++/FpQp3Y8Zd8ec/7dDMPBTbHc+3GdHmDKEHsaXv6c+iGpzReNo9/1Q/bZKFgEl6l8eAQtoffQ8iNXR4fuPbSk9B5KU3uPnF7u3xwVtfeACnBq7wEVqKm9B1RAUHsPqEBD7T2gApLae0AFFLX3gAq01N4DKtBRew+ogCYcKE3+EOjI9+Mvg80d8x35ehzIrwkH4rVckC05MFayJQfyyZYcyCdbciCfbMmBfLIlB/LJlhzG12RLDuTjLXkG/LYT0RRL/qGmS18q3Qwpcm/XpXHG3xzSBpII235trn8RhVcpe+xiLwdzY9ym94f0kdW03Rq/DPa3md94/skFcdkOwrQKsT9K5W5e3lCdv1g1T3jeA89f1SrYL+PDEVN3vOmEVJ1q02/a+v4A/RtxVA==",
      position = {0, 0}
    }
    chest_1 = game.surfaces[1].find_entities_filtered{name = "infinity-chest"}[3]
    chest_2 = game.surfaces[1].find_entities_filtered{name = "infinity-chest"}[5]
    step_1 = function()
      local wait = 10
      script.on_nth_tick(1, function()
        wait = wait - 1
        if wait == 0 then
          step_2()
        end
      end)
    end
    step_2 = function()
      script.on_nth_tick(1, function()
        if chest_1 then
          chest_1.insert({name = "jellynut", count = 1})
        end
        if chest_2 then
          chest_2.insert({name = "jellynut", count = 1, spoil_percent = 0.8})
        end
        step_1()
      end)
    end
    step_1()
  ]]
}

simulations.fulgora_briefing =
{
  init_update_count = 200,
  planet = "fulgora",
  mute_wind_sounds = false,
  init =
  [[
    require("__core__/lualib/story")
    game.simulation.camera_position = {0, 1.5}

    for x = -11, 10, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-sand"}}
      end
    end

    for x = -11, 10, 1 do
      for y = 1, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-dunes"}}
      end
    end

    for x = 2, 10, 1 do
      for y = -4, 0 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-walls"}}
      end
    end

    for x = 0, 10, 1 do
      for y = 0, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-conduit"}}
      end
    end

    for x = 2, 10, 1 do
      for y = -4, 0 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-machinery"}}
      end
    end

    for x = -11, -8, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "oil-ocean-deep"}}
      end
    end

    for k, position in pairs ({{-8, -4}, {-7, -4},
                               {-7, -3}, {-6, -3},
                               {-7, -2}, {-6, -2},
                               {-8, -1}, {-7, -1},
                               {-8, 0}, {-7, 0},
                               {-9, 1}, {-8, 1},
                               {-9, 2}, {-8, 2}, {-7, 2},
                               {-9, 3}, {-8, 3}, {-7, 3},
                               {-10, 4}, {-9, 4}, {-8, 4}, {-7, 4},
                               {-10, 5}, {-9, 5}, {-8, 5}, {-7, 5},
                               {-10, 6}, {-9, 6}, {-8, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "oil-ocean-shallow"}}
    end

    game.surfaces[1].create_entity{name="fulgoran-ruin-stonehenge", position = {3, -1}}
    game.surfaces[1].create_entity{name="fulgoran-ruin-stonehenge", position = {8, 2}}
    game.surfaces[1].create_entity{name="fulgoran-ruin-stonehenge", position = {4, 4}}

    for x = 5.5, 10.5, 1 do
      for y = -4, 4, 1 do
        game.surfaces[1].create_entity{name = "scrap", amount = 10, position = {x, y}}
      end
    end

    game.surfaces[1].create_entity{name = "scrap", amount = 10, position = {3, 6}}
    game.surfaces[1].create_entity{name = "scrap", amount = 10, position = {5, 5}}
    game.surfaces[1].create_entity{name = "cliff-fulgora", position = {-1 ,-6}, cliff_orientation = "north-to-south"}
    game.surfaces[1].create_entity{name = "cliff-fulgora", position = {-1 ,-1}, cliff_orientation = "north-to-east"}

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(2),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-7, 2}} end
        },
        {
          condition = story_elapsed_check(1.5),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-2, -4}} end
        },
        {
          condition = story_elapsed_check(3),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {8, 5}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-3, 2}} end
        },
        {
          condition = story_elapsed_check(2),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-6, -1}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {6, 4}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.lightning_mechanics =
{
  planet = "fulgora",
  mute_wind_sounds = false,
  init =
  [[
    require("__core__/lualib/story")
    game.simulation.camera_position = {0, 1.5}
    game.forces.player.recipes["lightning-rod"].enabled = true

    for x = -11, 10, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-sand"}}
      end
    end

    for x = -11, 10, 1 do
      for y = 1, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-dunes"}}
      end
    end

    for x = 2, 10, 1 do
      for y = -4, 0 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-walls"}}
      end
    end

    for x = 0, 10, 1 do
      for y = 0, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-conduit"}}
      end
    end

    for x = 2, 10, 1 do
      for y = -4, 0 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "fulgoran-machinery"}}
      end
    end

    game.surfaces[1].create_entity{name="lightning-rod", position = {-7, 3}}
    game.surfaces[1].create_entity{name="medium-electric-pole", position = {-4, 0}}
    game.surfaces[1].create_entity{name="medium-electric-pole", position = {2, 0}}
    game.surfaces[1].create_entity{name="accumulator", position = {-1, 3}}
    game.surfaces[1].create_entity{name="radar", position = {5, 2}}

    local story_table =
    {
      {
        {
          name = "start",
          condition = story_elapsed_check(1),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-7, 3}} end
        },
        {
          condition = story_elapsed_check(4),
          action = function()
            accumulator2 = game.surfaces[1].create_entity{name="accumulator", position = {-3, 3}}
            accumulator3 = game.surfaces[1].create_entity{name="accumulator", position = {1, 3}}
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function() game.surfaces[1].execute_lightning{name = "lightning", position = {-7, 3}} end
        },
        {
          condition = story_elapsed_check(8),
          action = function()
            accumulator2.destroy()
            accumulator3.destroy()
          end
        },
        {
          condition = story_elapsed_check(1),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.gleba_briefing =
{
  planet = "gleba",
  mute_wind_sounds = false,
  init =
  [[
    game.simulation.camera_position = {0, 1.5}

    for x = -12, 12, 1 do
      for y = -6, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "wetland-jellynut"}}
      end
    end

    for k, position in pairs ({{-12, -6}, {-11, -6}, {-10, -6}, {-9, -6}, {-8, -6}, {-7, -6}, {-6, -6}, {-5, -6}, {-4, -6}, {-3, -6},
                               {-2, -6}, {-1, -6}, {0, -6}, {1, -6}, {2, -6}, {3, -6}, {-12, -5}, {-11, -5}, {-10, -5}, {-9, -5},
                               {-8, -5}, {-7, -5}, {-6, -5}, {-5, -5}, {-4, -5}, {-3, -5}, {-2, -5}, {-1, -5}, {0, -5}, {1, -5}, {2, -5},
                               {-12, -4}, {-11, -4}, {-10, -4}, {-9, -4}, {-8, -4}, {-7, -4}, {-6, -4}, {-5, -4}, {-4, -4}, {-3, -4},
                               {-2, -4}, {-1, -4}, {0, -4}, {1, -4}, {2, -4}, {-12, -3}, {-11, -3}, {-10, -3}, {-9, -3}, {-8, -3},
                               {-7, -3}, {-6, -3}, {-5, -3}, {-4, -3}, {-3, -3}, {-2, -3}, {-1, -3}, {0, -3}, {1, -3}, {-12, -2}, {-11, -2},
                               {-10, -2}, {-9, -2}, {-8, -2}, {-7, -2}, {-6, -2}, {-5, -2}, {-4, -2}, {-3, -2}, {-2, -2}, {-1, -2},
                               {0, -2}, {-12, -1}, {-11, -1}, {-8, -1}, {-7, -1}, {-6, -1}, {-5, -1}, {-4, -1}, {-3, -1}, {-2, -1},
                               {-1, -1}, {0, -1}, {-12, 0}, {-11, 0}, {-8, 0}, {-7, 0}, {-6, 0}, {-5, 0}, {-4, 0}, {-3, 0}, {-2, 0},
                               {-1, 0}, {-12, 1}, {-11, 1}, {-10, 1}, {-9, 1}, {-8, 1}, {-7, 1}, {-6, 1}, {-5, 1}, {-4, 1}, {-12, 2},
                               {-9, 2}, {-8, 2}, {-7, 2}, {-6, 2}, {-5, 2}, {-4, 2}, {-12, 3}, {-9, 3}, {-8, 3}, {-7, 3}, {-6, 3},
                               {-5, 3}, {-4, 3}, {-3, 3}, {-2, 3}, {-12, 4}, {-11, 4}, {-10, 4}, {-9, 4}, {-8, 4}, {-7, 4}, {-6, 4},
                               {-5, 4}, {-4, 4}, {-12, 5}, {-11, 5}, {-10, 5}, {-9, 5}, {-8, 5}, {-12, 6}, {-11, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "midland-yellow-crust"}}
    end

    for k, position in pairs ({{1, -2}, {-10, -1}, {-9, -1}, {-10, 0}, {-9, 0}, {0, 0}, {-3, 1}, {-2, 1}, {-1, 1}, {-11, 2}, {-10, 2},
                               {-3, 2}, {-2, 2}, {-1, 2}, {-11, 3}, {-10, 3}}) do
      game.surfaces[1].set_tiles{{position = position, name = "midland-yellow-crust-2"}}
    end

    for k, position in pairs ({{1, -1}, {1, 0}, {0, 1}, {1, 1}, {2, 1}, {0, 2}, {1, 2}, {2, 2}, {-1, 3}, {0, 3}, {1, 3}}) do
      game.surfaces[1].set_tiles{{position = position, name = "lowland-red-vein-2"}}
    end

    game.surfaces[1].set_tiles{{position = {-7, 5}, name = "lowland-red-vein-dead"}}
    game.surfaces[1].set_tiles{{position = {-10, 6}, name = "lowland-red-vein-dead"}}


    local create_list = {}

    for k, position in pairs ({{-14, -8}, {-13, -8}, {-12, -6}, {-10, -7}, {-8, -7}, {-11, -3}, {-11, 0}}) do
      table.insert(create_list, { name = "dark-mud-decal", position = position, amount = 1})
    end

    for k, position in pairs ({{-7, -9}, {0, -9}, {-1, -8}, {-12, -7}, {-6, -6}}) do
      table.insert(create_list, { name = "light-mud-decal", position = position, amount = 1})
    end

    for k, position in pairs ({{-10, -6}, {3, -7}, {7, -6}, {6, -4}, {7, -4}, {9, -5}, {6, 0}, {2, 1}, {-13, 5}}) do
      table.insert(create_list, { name = "pale-lettuce-lichen-cups-1x1", position = position, amount = 1})
    end

    for k, position in pairs ({{-1, -6}, {-9, -4}, {-2, -5}, {-2, -4}, {5, -4}, {1, -3}, {9, 0}, {-4, 2}, {-3, 2}, {5, 2}, {9, 1}, {12, 1}}) do
      table.insert(create_list, { name = "pale-lettuce-lichen-cups-1x1", position = position, amount = 2})
    end

    for k, position in pairs ({{-12, -8}, {-13, -6}, {-11, -7}, {-8, -6}, {-6, -6}, {-11, -5}, {-9, -4}, {0, -5}, {4, -4}, {7, -4},
                               {-9, -2}, {1, -2}, {2, -2}, {2, 0}, {2, 2}, {-4, 4}, {-12, 6}, {-4, 5}}) do
      table.insert(create_list, { name = "pale-lettuce-lichen-cups-3x3", position = position, amount = 1})
    end

    table.insert(create_list, { name = "pale-lettuce-lichen-cups-3x3", position = {-12, -1}, amount = 2 })

    for k, position in pairs ({{-10, 0}, {2, 3}, {1, 4}}) do
      table.insert(create_list, { name = "pale-lettuce-lichen-cups-6x6", position = position, amount = 1})
    end

    table.insert(create_list, { name = "nerve-roots-veins-dense", position = {3, -9}, amount = 1 })

    table.insert(create_list, { name = "nerve-roots-veins-sparse", position = {-12, 6}, amount = 1 })

    for k, position in pairs ({{-11, -6}, {-8, -6}, {-12, -4}, {-11, -5}, {-10, -5}, {-11, -4}, {-10, -4}, {-6, -5}, {-12, -2},
                               {-10, -3}, {-10, -2}, {-8, -3}, {-9, -2}, {-7, -3}, {-10, -1}}) do
      table.insert(create_list, { name = "knobbly-roots-orange", position = position, amount = 1})
    end

    table.insert(create_list, { name = "knobbly-roots-orange", position = {-10, -6}, amount = 2 })

    table.insert(create_list, { name = "brambles", position = {0, -6}, amount = 1 })
    table.insert(create_list, { name = "brambles", position = {0, -5}, amount = 1 })

    table.insert(create_list, { name = "blood-grape", position = {2, -7}, amount = 1 })

    table.insert(create_list, { name = "matches-small", position = {-5, -5}, amount = 1 })

    for k, position in pairs ({{6, -5}, {9, -4}, {10, -4}, {8, 2}, {10, 1}, {9, 2}, {9, 4}, {11, -6}, {11, -5}, {12, -4}, {11, -3}, {11, 5}}) do
      table.insert(create_list, { name = "coral-water", position = position, amount = 1})
    end

    for k, position in pairs ({{7, -7}, {10, -6}, {6, -4}, {8, -5}, {9, -5}, {9, 0}, {10, 2}, {8, 3}, {10, 3}, {13, -4}, {12, 1}, {12, 3}, {12, 4}}) do
      table.insert(create_list, { name = "coral-water", position = position, amount = 2})
    end

    for k, position in pairs ({{-5, -3}, {-4, -2}, {-5, -1}, {-4, -1}, {-1, -1}, {-11, 1}, {-11, 3}}) do
      table.insert(create_list, { name = "pink-lichen-decal", position = position, amount = 1})
    end

    for k, position in pairs ({{1, 1}, {2, 1}, {2, 2}, {-1, 3}}) do
      table.insert(create_list, { name = "split-gill-1x1", position = position, amount = 1})
    end

    table.insert(create_list, { name = "yellow-lettuce-lichen-cups-1x1", position = {5, -3}, amount = 1 })

    for k, position in pairs ({{-11, -6}, {-10, -6}, {-8, -5}, {-2, -4}}) do
      table.insert(create_list, { name = "yellow-lettuce-lichen-cups-3x3", position = position, amount = 1})
    end

    table.insert(create_list, { name = "yellow-lettuce-lichen-cups-3x3", position = {-11, -2}, amount = 2 })

    for k, position in pairs ({{-10, -6}, {-11, -4}, {-9, -4}, {-3, -4}, {-2, -4}, {1, -3}, {-4, 2}, {-3, 2}, {-12, 4}, {-11, 3},
                               {-10, 4}, {-8, 3}, {-11, 6}, {-7, 5}}) do
      table.insert(create_list, { name = "yellow-lettuce-lichen-1x1", position = position, amount = 1})
    end

    for k, position in pairs ({{-7, -6}, {-5, -7}, {-4, -7}, {-13, -5}, {-12, -5}, {-5, -5}, {-8, -3}, {-3, -3}, {-3, -2}, {0, -2},
                               {-5, -1}, {-11, 1}, {-5, 2}, {-6, 3}}) do
      table.insert(create_list, { name = "yellow-lettuce-lichen-3x3", position = position, amount = 1})
    end

    game.surfaces[1].create_decoratives{decoratives = create_list}

    game.surfaces[1].create_entity{name = "boompuff", position = {-6.9375, -6.375}}
    game.surfaces[1].create_entity{name = "boompuff", position = {-9.375, -0.5}}
    game.surfaces[1].create_entity{name = "water-cane", position = {1.4375, 4.1875}}
    game.surfaces[1].create_entity{name = "water-cane", position = {3.125, 4.4375}}
    game.surfaces[1].create_entity{name = "water-cane", position = {1.1875, 6.1875}}
    game.surfaces[1].create_entity{name = "water-cane", position = {2.125, 6.4375}}
    game.surfaces[1].create_entity{name = "water-cane", position = {3.1875, 6.75}}
    game.surfaces[1].create_entity{name = "water-cane", position = {4.75, 6}}
    game.surfaces[1].create_entity{name = "water-cane", position = {5.4375, 6.125}}
    game.surfaces[1].create_entity{name = "water-cane", position = {7.5625, 6.375}}

    game.surfaces[1].create_entity{name = "small-strafer-pentapod", position = {6, 0}}
  ]]
}

simulations.agriculture =
{
  init_update_count = 200,
  planet = "gleba",
  mute_wind_sounds = false,
  init =
  [[
    require("__core__/lualib/story")
    game.simulation.camera_position = {0, 1.5}

    for x = -11, 2, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "wetland-yumako"}}
      end
    end

    for x = 3, 10, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "lowland-olive-blubber"}}
      end
    end

    for k, position in pairs ({{-2, -4}, {-1, -4}, {0, -4}, {1, -4}, {2, -4},
                               {-1, -3}, {0, -3}, {1, -3}, {2, -3},
                               {-1, -2}, {0, -2}, {1, -2}, {2, -2},
                               {-1, -1}, {0, -1}, {1, -1}, {2, -1},
                               {-2, 0}, {-1, 0}, {0, 0}, {1, 0}, {2, 0},
                               {-2, 1}, {-1, 1}, {0, 1}, {1, 1}, {2, 1},
                               {-2, 2}, {-1, 2}, {0, 2}, {1, 2}, {2, 2},
                               {-3, 3}, {-2, 3}, {-1, 3}, {0, 3}, {1, 3}, {2, 3},
                               {-3, 4}, {-2, 4},
                               {-4, 5}, {-3, 5}
                               }) do
      game.surfaces[1].set_tiles{{position = position, name = "lowland-olive-blubber"}}
    end

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqtmuFu4joQhd/Fv8MK22OT9FVWFQpgeq0NCUqc3eVWvPt1YAGppL0en+0vmuTMsZ3vTJ2Ud7FpRnfsfRvEy7vw264dxMv3dzH4t7ZupmNtfXDiRezrISxCX7fDsevDYuOaIM6F8O3O/RYv8vxaCNcGH7y7Frj8clq342Hj+nhBcSvk271v46nF9h83BFGIYzdEWddOZlMpvfpmCnGKn4z8Zi4eV8V6cCH49m2Yruzdofvp1mM81wTXu93aB3eIp/Z1M7hCXA9fx/LH+TQe6h/dYnBuF2233ThNWi4Lceh20/k6LBpXX8b0mNb5XDxNRt0nM4R6+2Ph28H10e3ryag4mZliuvhqib+sqC/Ls/O9216vKGfq072+a+J1vd8uXOv6t1Mcdhzzvt66GRda3kYdHTbjfu/69eD/ddOC3X9m3MxjacZNXJ1LzZny6l5+pojNXxKTsiSr/PqUUr/Mr79KqV/l17cp9adM5BpUHw1ozkDmG5RJM1Bcg4o5A3ZsS6YBMQ1IMg0M12DJNODGmDTTgJtjUkwDbpDJMA24SSbiGShukomZZMVNMlmmATfJxEyy4iaZmElW3CQbZpIVN8mGmWT1SLL7fezdMCyart7NbniM/rRyIcLpeN0CHsdp9/hstErfJpqPUeBtE0M/utm9XcnY3N1JsMv5zZ2q0qs9GriVH9dOqrmd4zK7wT47zN13LbMbbKKBym6wiQY6u8EmGlB2g000MNkNNtHAZjfYRINVdoNNNCizG2yiQZXdYNMMaMlvsDOV/7/BksxpsFb+xQZLj8zXb/FpdGzC2NfNInS/5pvsA7dPnqBJ8x46rT1Pryt+xZWb3g98N4UpYg3zGg8G3/x5gfE0Dnt7xDzf7Zq63cV5N5el/lRgUwUrruDmsOI6JAtKpmD6g3d9THsI6j74vd/6eJNvr2A6/4nfEpNLTK4wucbkhMnNszyNnpJLT8mlp+TSU2H0VBg9FUZPhdFTYfRUGD0Vl56KS0/FpSdvRjeW7BJiKVcuMbnC5BqTEyY3z/IkltIFK6bgDoPEYJAYDBKDQWIwSAwGicEguTBILgySC4PCYFAYDAqDQWEwKAwGhcGguDAoLgyKC4PGYNAYDBqDQWMwaAwGjcGguTBoLgypAsJuB2G3444iYSgShiJhKBKGImEoEoZiptxi8hUmLzE5Rh1h1BFGHWHUEUbdPbAGC6zBAmuwwBossAYLrMECa7DAGiywBguswQJrsMAaLLAGC6zBAmuwwFossBYLrMUCa7HAWiywFgusxQJrscBaLLAWC6zFAmuxwFossAny10JM//yJVzy+VVqIn64fLgVVKanUxlpLxpI6n/8DNjfWKA==",
      position = {3, -1}
    }

    local story_table =
    {
      {
        {
          name = "start",
          action = function() game.speed = 1 end
        },
        {
          condition = story_elapsed_check(17),
          action = function() game.speed = 10 end
        },
        {
          condition = story_elapsed_check(290),
          action = function() game.speed = 1 end
        },
        {
          name = "continue",
          action = function() game.speed = 1 end
        },
        {
          action = function() story_jump_to(storage.story, "continue") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}

simulations.vulcanus_briefing =
{
  init_update_count = 200,
  planet = "vulcanus",
  mute_wind_sounds = false,
  init =
  [[
    game.simulation.camera_position = {0, 1.5}

    for x = -11, 10, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "volcanic-ash-dark"}}
      end
    end

    for k, position in pairs ({{-8, 3}, {-7, 3},
                               {-10, 4}, {-9, 4}, {-8, 4}, {-7, 4}, {-6, 4},
                               {-10, 5}, {-9, 5}, {-8, 5}, {-7, 5},
                               {-11, 6}, {-10, 6}, {-9, 6}, {-8, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "lava"}}
    end

    for k, position in pairs ({{-8, 2}, {-7, 2},
                               {-9, 3}, {-6, 3},
                               {-11, 4}, {-5, 4},
                               {-11, 5}, {-6, 5},
                               {-12, 6}, {-7, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-cracks-hot"}}
    end

    for k, position in pairs ({{-9, 2}, {0, 2}, {1, 2},
                               {-11, 3}, {-10, 3}, {-1, 3}, {0, 3}, {1, 3},
                               {-2, 4}, {-1, 4}, {0, 4}, {1, 4}, {2, 4}, {3, 4},
                               {-5, 5}, {-4, 5}, {-3, 5}, {-2, 5}, {-1, 5}, {0, 5}, {1, 5}, {2, 5}, {3, 5},
                               {-6, 6}, {-5, 6}, {-4, 6}, {-3, 6}, {-2, 6}, {-1, 6}, {0, 6}, {1, 6}, {2, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-smooth-stone"}}
    end

    for k, position in pairs ({{3, 6}, {4, 6}, {5, 6}, {6, 6}, {8, 6}, {9, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "lava-hot"}}
    end

    for k, position in pairs ({{-11, 0}, {-10, 0}, {-9, 0}, {-8, 0}, {-7, 0},
                               {-11, 1}, {-10, 1}, {-9, 1}, {-8, 1}, {-7, 1}, {-6, 1}, {-5, 1},
                               {-11, 2}, {-10, 2}, {-6, 2}, {-5, 2}, {-4, 2}, {-1, 2},
                               {-5, 3}, {-4, 3}, {-3, 3}, {-2, 3},
                               {-4, 4}, {-3, 4}, {4, 4}, {5, 4}, {6, 4}, {7, 4}, {8, 4}, {9, 4}, {10, 4},
                               {4, 5}, {5, 5}, {6, 5}, {7, 5}, {8, 5}, {9, 5}, {10, 5},
                               {7, 6}, {10, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-soil-dark"}}
    end

    for k, position in pairs ({{-11, -4}, {-10, -4}, {-9, -4}, {-8, -4}, {-1, -4}, {0, -4}, {1, -4}, {2, -4}, {3, -4}, {4, -4}, {5, -4}, {6, -4}, {7, -4}, {8, -4}, {9, -4}, {10, -4},
                               {-11, -3}, {-10, -3}, {-9, -3}, {-8, -3}, {-7, -3}, {-6, -3}, {0, -3}, {1, -3}, {2, -3}, {3, -3}, {4, -3}, {5, -3}, {6, -3}, {7, -3}, {8, -3}, {9, -3}, {10, -3},
                               {-9, -2}, {-8, -2}, {-7, -2}, {-5, -2}, {1, -2}, {2, -2}, {3, -2}, {4, -2}, {5, -2}, {6, -2}, {7, -2}, {8, -2}, {9, -2},
                               {2, -1}, {3, -1}, {4, -1}, {5, -1}, {6, -1}, {7, -1}, {8, -1},
                               {5, 0}, {6, 0}, {7, 0},
                               {5, 1}, {6, 1}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-ash-cracks"}}
    end

    game.surfaces[1].create_entity{name = "vulcanus-chimney", position = {4.5, -0.5}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {8.5, -3.5}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {6.5, -2.5}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {8.5, 0.5}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree", position = {5.5, 1.5}}
    game.surfaces[1].create_entity{name = "ashland-lichen-tree-flaming", position = {9.5, 1.5}}

    local create_list = {}
    table.insert(create_list, { name = "v-red-pita", position = {-3, 0}, amount = 1})
    for k, position in pairs ({{-10, -3}, {-8, -3}, {4, -3},
                               {8, 1}}) do
      table.insert(create_list, { name = "v-brown-carpet-grass", position = position, amount = 1})
    end
    for k, position in pairs ({{-10, 2},
                               {-8, 3}, {-7, 3}, {5, 3}, {7, 3},
                               {3, 4}, {6, 4},
                               {1, 5}}) do
      table.insert(create_list, { name = "tiny-rock-cluster", position = position, amount = 1})
    end
    game.surfaces[1].create_decoratives{decoratives = create_list}

  ]]
}

simulations.lava_processing =
{
  init_update_count = 100,
  planet = "vulcanus",
  mute_wind_sounds = false,
  init =
  [[
    game.simulation.camera_position = {0, 1.5}
    game.forces.player.technologies["foundry"].researched = true

    for x = -11, 10, 1 do
      for y = -4, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "volcanic-ash-dark"}}
      end
    end

    for k, position in pairs ({{-8, 2}, {-7, 2},
                               {-9, 3}, {-6, 3},
                               {-11, 4}, {-5, 4},
                               {-11, 5}, {-6, 5},
                               {-12, 6}, {-7, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-cracks-hot"}}
    end

    for k, position in pairs ({{-9, 2}, {0, 2}, {1, 2},
                               {-11, 3}, {-10, 3}, {-1, 3}, {0, 3}, {1, 3},
                               {-2, 4}, {-1, 4}, {0, 4}, {1, 4}, {2, 4}, {3, 4},
                               {-5, 5}, {-4, 5}, {-3, 5}, {-2, 5}, {-1, 5}, {0, 5}, {1, 5}, {2, 5}, {3, 5},
                               {-6, 6}, {-5, 6}, {-4, 6}, {-3, 6}, {-2, 6}, {-1, 6}, {0, 6}, {1, 6}, {2, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-smooth-stone"}}
    end

    for k, position in pairs ({{-11, 0}, {-10, 0}, {-9, 0}, {-8, 0}, {-7, 0},
                               {-11, 1}, {-10, 1}, {-9, 1}, {-8, 1}, {-7, 1}, {-6, 1}, {-5, 1},
                               {-11, 2}, {-10, 2}, {-6, 2}, {-5, 2}, {-4, 2}, {-1, 2},
                               {-5, 3}, {-4, 3}, {-3, 3}, {-2, 3},
                               {-4, 4}, {-3, 4}, {4, 4}, {5, 4}, {6, 4}, {7, 4}, {8, 4}, {9, 4}, {10, 4},
                               {4, 5}, {5, 5}, {6, 5}, {7, 5}, {8, 5}, {9, 5}, {10, 5},
                               {7, 6}, {10, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-soil-dark"}}
    end

    for k, position in pairs ({{-11, -4}, {-10, -4}, {-9, -4}, {-8, -4}, {-1, -4}, {0, -4}, {1, -4}, {2, -4}, {3, -4}, {4, -4}, {5, -4}, {6, -4}, {7, -4}, {8, -4}, {9, -4}, {10, -4},
                               {-11, -3}, {-10, -3}, {-9, -3}, {-8, -3}, {-7, -3}, {-6, -3}, {0, -3}, {1, -3}, {2, -3}, {3, -3}, {4, -3}, {5, -3}, {6, -3}, {7, -3}, {8, -3}, {9, -3}, {10, -3},
                               {-9, -2}, {-8, -2}, {-7, -2}, {-5, -2}, {1, -2}, {2, -2}, {3, -2}, {4, -2}, {5, -2}, {6, -2}, {7, -2}, {8, -2}, {9, -2},
                               {2, -1}, {3, -1}, {4, -1}, {5, -1}, {6, -1}, {7, -1}, {8, -1},
                               {5, 0}, {6, 0}, {7, 0},
                               {5, 1}, {6, 1}}) do
      game.surfaces[1].set_tiles{{position = position, name = "volcanic-ash-cracks"}}
    end

    for x = -11, -7, 1 do
      for y = 5, 7 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "lava"}}
      end
    end

    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqlmNuS4iAQht+F62QqCZCDrzJlWTGSGWoTyAKZHXfKd18SV3RXlMN4pYF8f3dD0y1fYD/MZBKUKbD5ArTjTILN6xeQ9I21w/KMtSMBG9DzmR3EEZwSQNmBfIJNfkps81qpUiVaJicuVLong7p5pzhtE0CYooqSs9D647hj87gnQkOTC4iynjI9lHbvRCqQgIlL/Rpni5hGpQ16wQk4gk2ZveBV4vzCThKlKHuTy0RBRv5BdrMeGxQR5LCjiox6qG8HSRJwfnw25a9w1w6dnqQVO+2zjgvOEjDywzLWqnQg7WqOicL2tATiPz8K4wcZSKcE7VLCiHg7pjrURPRtRywu1dXZIR1acKBCv7gO1gnYz31PxE7S35qZZ+ZjkYZGWs57qdqVYdHCFy0LA13N/5wEkTIdeHvQI8+WobizWh2nhcFnNc3LNrjTwcmzffNMDK5rfitnwZfReOSDr6Lx2AdfG/xEJ+t2aW55FkLjJNQOQp45EaULkTsRlQtROBHIhYBOBHYhkBNRuBDYiYAuROlEZC5E5UTkLkQdvfdLn72fN9H8yodfZNH82oufR/MbL/41I/bz8ENXFUmEsh/Q8CE5L2zoa6Zcir4Fmv0bDo2k61k/cl1QWUoFZ2kv+JgO7UcLLhN2P+d20GJ6IuNi1J2DzQDkYUDVPF6PG3M6HXzdC6z2BFrhTNXmku1Vbk+SwpmqTe5CVN7rbM7yh6w6qDOoMiuk8TfI5RzMvFlmuR+yrgnH+16+c0HSaR6np+tW+KQaLAJT2ZTlyqtJgTCa72c/CuXXD/nWAwPiaAG/AIW2caafuOfbHQht5EzP4ysQWi1NO+MrEFouTbPjKYBC66VphXwFQgumaZR8BYLTOAsUCM7jPFAARXvgdVAgHO3AHR/Z+KF5XDVhBxHyL5amf6mQl+l19Bnt9VcPNdF8r3+qOIs+ov34eTTfKz648L+QuKKrRxcSlD26j4ABOs03dJD/PdfVnzrinkuJmdj6JYwDLGi+b8E2Ab90iJabtleY4EQ3o3irHy6Tlnw115AJ+CBCrupFnaMa4rKCZam/nU5/AEALu0I=",
      position = {-1, 1}
    }

  ]]
}

simulations.aquilo_briefing =
{
  planet = "aquilo",
  mute_wind_sounds = false,
  init =
  [[
    game.simulation.camera_position = {0, 1.5}

    for x = -12, 12, 1 do
      for y = -6, 6 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "ice-smooth"}}
      end
    end

    for k, position in pairs ({{-1, -6}, {0, -6}, {1, -6}, {2, -6}, {-2, -5}, {-1, -5}, {0, -5}, {1, -5}, {2, -5}, {-5, -4}, {-4, -4},
                               {-3, -4}, {-2, -4}, {0, -4}, {1, -4}, {-6, -3}, {-5, -3}, {-12, -2}, {-11, -2}, {-10, -2}, {-6, -2},
                               {-12, -1}, {-11, -1}, {-10, -1}, {-9, -1}, {-8, -1}, {-7, -1}, {-6, -1}, {-12, 0}, {-11, 0}, {-10, 0},
                               {-9, 0}, {-8, 0}, {-7, 0}, {-12, 1}, {-11, 1}, {-10, 1}, {-9, 1}, {-8, 1}, {-7, 1}, {-6, 1}, {-12, 2},
                               {-11, 2}, {-10, 2}, {-9, 2}, {-8, 2}, {-7, 2}, {-6, 2}, {-12, 3}, {-11, 3}, {-10, 3}, {-9, 3}, {-8, 3},
                               {-7, 3}, {-6, 3}, {-12, 4}, {-11, 4}, {-10, 4}, {-9, 4}, {-8, 4}, {-7, 4}, {-6, 4}, {-12, 5}, {-11, 5},
                               {-10, 5}, {-9, 5}, {-8, 5}, {-7, 5}, {-6, 5}, {-10, 6}, {-9, 6}, {-8, 6}, {-7, 6}, {-6, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "ice-rough"}}
    end

    for k, position in pairs ({{-8, -6}, {-7, -6}, {-6, -6}, {-5, -6}, {-4, -6}, {-3, -6}, {-2, -6}, {-7, -5}, {-6, -5}, {-5, -5},
                               {-4, -5}, {-3, -5}, {-12, -4}, {-7, -4}, {-6, -4}, {-12, -3}, {-11, -3}, {-10, -3}, {-9, -3}, {-8, -3},
                               {-7, -3}, {-9, -2}, {-8, -2}, {-7, -2}}) do
      game.surfaces[1].set_tiles{{position = position, name = "brash-ice"}}
    end

    for k, position in pairs ({{-1, -4}, {2, -4}, {-3, -3}, {-2, -3}, {-1, -3}, {0, -3}, {1, -3}, {2, -3}, {-5, -2}, {-4, -2}, {-3, -2},
                               {-2, -2}, {-1, -2}, {-5, -1}, {-4, -1}, {-3, -1}, {-6, 0}, {-5, 0}, {-12, 6}, {-11, 6}}) do
      game.surfaces[1].set_tiles{{position = position, name = "snow-crests"}}
    end

    for k, position in pairs ({{-12, -6}, {-11, -6}, {-10, -6}, {-9, -6}, {-12, -5}, {-11, -5}, {-10, -5}, {-9, -5}, {-8, -5},
                               {-11, -4}, {-10, -4}, {-9, -4}, {-8, -4}}) do
      game.surfaces[1].set_tiles{{position = position, name = "ammoniacal-ocean-2"}}
    end

    game.surfaces[1].set_tiles{{position = {-4, -3}, name = "snow-lumpy"}}
    game.surfaces[1].set_tiles{{position = {-4, 0}, name = "snow-lumpy"}}

    local create_list = {}

    for k, position in pairs ({{1, -6}, {9, -4}, {0, -2}, {-4, 0}, {-3, -1}, {10, -1}, {-6, 2}, {-4, 1}, {10, 2}, {-7, 4}, {-8, 5}, {-6, 5}}) do
      table.insert(create_list, { name = "lithium-iceberg-tiny", position = position, amount = 1})
    end

    for k, position in pairs ({{3, -6}, {4, -6}, {5, -6}, {6, -6}, {3, -5}, {4, -5}, {3, -4}, {4, -4}, {5, -5}, {6, -5}, {7, -5},
                              {-4, -3}, {-4, -2}, {-3, -2}, {1, -2}, {2, -2}, {4, -3}, {8, -3}, {7, -2}, {9, -3}, {-11, -1}, {-10, -1},
                              {-11, 0}, {-9, 0}, {-8, 0}, {-5, -1}, {-1, 0}, {0, 0}, {1, -1}, {7, -1}, {-8, 1}, {-7, 2}, {-4, 2},
                              {-3, 2}, {-1, 1}, {0, 1}, {-1, 2}, {0, 2}, {4, 2}, {6, 1}, {9, 2}, {-13, 3}, {-13, 4}, {-11, 4}, {-10, 4},
                              {-9, 3}, {-8, 3}, {-7, 3}, {-5, 3}, {-4, 3}, {-5, 4}, {-4, 4}, {-3, 3}, {-1, 3}, {0, 3}, {-1, 4}, {0, 4},
                              {1, 3}, {1, 4}, {2, 4}, {3, 3}, {4, 3}, {3, 4}, {5, 3}, {6, 4}, {7, 4}, {8, 4}, {9, 3}, {10, 3}, {9, 4},
                              {11, 4}, {-5, 5}, {-4, 6}, {3, 5}, {4, 5}, {4, 6}, {5, 5}, {6, 5}, {6, 6}, {7, 5}, {7, 6}, {8, 6}, {10, 6}}) do
      table.insert(create_list, { name = "lithium-iceberg-small", position = position, amount = 1})
    end

    for k, position in pairs ({{4, -7}, {5, -4}, {6, -4}, {7, -4}, {4, -2}, {5, -3}, {6, -3}, {5, -2}, {6, -2}, {7, -3}, {-10, 0},
                               {2, -1}, {1, 0}, {2, 0}, {3, -1}, {4, -1}, {3, 0}, {4, 0}, {5, -1}, {5, 0}, {-12, 1}, {-12, 2}, {-11, 1},
                               {-10, 1}, {-11, 2}, {-10, 2}, {-9, 2}, {1, 1}, {2, 1}, {2, 2}, {3, 1}, {4, 1}, {3, 2}, {-12, 3}, {-11, 3},
                               {-10, 3}, {-3, 4}, {-2, 4}, {2, 3}, {-3, 5}, {-2, 5}, {-1, 5}, {0, 5}, {-1, 6}, {0, 6}, {1, 5}, {2, 5},
                               {1, 6}, {2, 6}, {3, 6}, {2, 7}, {3, 7}}) do
      table.insert(create_list, { name = "lithium-iceberg-medium", position = position, amount = 1})
    end

    for k, position in pairs ({{6, -9}, {9, -8}, {9, -7}, {9, -2}, {11, -3}, {12, -3}, {6, 1}, {7, 1}, {14, -1}, {-11, 4}, {-7, 3},
                               {5, 4}, {-11, 5}, {-7, 6}, {7, 5}, {-9, 7}, {-7, 7}, {0, 8}, {6, 7}}) do
      table.insert(create_list, { name = "aqulio-snowy-decal", position = position, amount = 1})
    end

    for k, position in pairs ({{9, -8}, {9, -7}, {10, -6}, {12, -3}, {-5, 2}, {7, 1}, {-7, 3}, {10, 4}, {-8, 6}, {-6, 5}, {-7, 6},
                               {-5, 6}, {7, 5}, {8, 5}, {-9, 7}, {-7, 7}, {6, 7}}) do
      table.insert(create_list, { name = "snow-drift-decal", position = position, amount = 1})
    end

    game.surfaces[1].create_decoratives{decoratives = create_list}

    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {3.875, -6.25}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {6.125, -3.5625}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {-3.8125, -1.5}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {2.375, -1.9375}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {-8.75, 0.6875}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {1.8125, 0.3125}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {5.3125, 0.3125}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {-9.25, 2.8125}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {-2.875, 2.0625}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {0.3125, 2.6875}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {3.9375, 2.375}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {-4.625, 4.5}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-big", position = {3.6875, 4.75}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {7.125, 4.625}}
    game.surfaces[1].create_entity{name = "lithium-iceberg-huge", position = {-1.75, 6.5625}}

    game.surfaces[1].create_entity{name = "lithium-brine", amount = 10, position = {-8, -2}}
  ]]
}

return simulations
