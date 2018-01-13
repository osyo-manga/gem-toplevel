using Toplevel.local {
	def hoge
		:hoge
	end
}

RSpec.describe Toplevel do
	describe ".local" do
		it { expect(hoge).to eq :hoge }

		describe "other local" do
			using Toplevel.local {
				def hoge
					:other
				end
			}
			it { expect(hoge).to eq :other }
		end

		describe "class scope" do
			class X
				using Toplevel.local {
					def hoge
						:x_hoge
					end
				}

				def foo
					hoge
				end
			end
			it { expect(X.new.foo).to eq :x_hoge }
		end
	end
end
