class Object
	def hoge
		:hoge
	end
end

using Toplevel.local {
	def foo
		:foo
	end
}

RSpec.describe Toplevel do
	describe ".local" do
		it { expect(foo).to eq :foo }
		it { expect{ self.foo }.to raise_error(NoMethodError) }

		describe "other local" do
			using Toplevel.local {
				def hoge
					:other_hoge
				end

				def foo
					:other_foo
				end
			}
			it { expect(hoge).to eq :other_hoge }
			it { expect{ self.hoge }.to raise_error(NoMethodError) }

			it { expect(foo).to eq :other_foo }
			it { expect{ self.foo }.to raise_error(NoMethodError) }
		end

		it { expect(hoge).to eq :hoge }
		it { expect(self.hoge).to eq :hoge }

		describe "class scope" do
			class X
				using Toplevel.local {
					def bar
						:x_bar
					end
				}

				def call
					bar
				end
			end
			it { expect(X.new.call).to eq :x_bar }
			it { expect{ X.new.bar }.to raise_error(NoMethodError) }
			it { expect{ X.new.foo }.to raise_error(NoMethodError) }
		end
	end
end
